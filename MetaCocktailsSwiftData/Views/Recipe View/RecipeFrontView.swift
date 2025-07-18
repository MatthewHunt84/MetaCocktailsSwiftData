//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI
import SwiftData

struct RecipeFlipCardView: View {
    
    @State private var isShowingCocktailNotes = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    @Binding var borderColor: BorderGradient
    @Binding var scrollID: Cocktail.ID?
    @State var historicBorderColor = ColorScheme.inactiveBorder
    @State private var showingHistoricInfo = false
    var recommendedCocktailID: UUID? = nil
    @State private var showSpecInMl: Bool = false
    
    var body: some View {
        
        GeometryReader { outerGeo in
            
            ZStack {
                
                RecipeViewBack(viewModel: viewModel, parentGeo: outerGeo)
                
                ZStack {
                    
                    BackgroundGlowAnimation(gradient: viewModel.cocktail.historicSpec != nil ? historicBorderColor.top : borderColor.top, isFavorite: $viewModel.cocktail.favorite)
                    
                    ZStack {
                        
                        FadingEdgesScrollView {
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                FlipCardNavigationHeader(viewModel: viewModel)
                                
                                if recommendedCocktailID != nil {
                                    HistoricalRecipeView(showingHistoricInfo: $showingHistoricInfo, scrollID: $scrollID, recommendedCocktailID: recommendedCocktailID)
                                }
                                
                                if let cocktailNote = viewModel.cocktail.notes {
                                    NoteView(note: cocktailNote)
                                }
                                
                                GlasswareView(cocktail: viewModel.cocktail)
                                
                                SpecView(cocktail: viewModel.cocktail, viewModel: viewModel, isShowingCocktailNotes: $isShowingCocktailNotes, specInMl: $showSpecInMl)
                                
                                GarnishView(cocktail: viewModel.cocktail)
                                
                                MethodIceView(cocktail: viewModel.cocktail, methodText: viewModel.methodString)
                                
                                if viewModel.cocktail.buildOrder != nil {
                                    UniversalButton(buttonText: "Build Order", rightImage: Image(systemName: "arrow.triangle.2.circlepath"), includeBorder: true) {
                                        viewModel.flipCard()
                                    }
                                    .disabled(viewModel.isFlipped)
                                }
                                
                                if viewModel.cocktail.author != nil {
                                    AuthorView(cocktail: viewModel.cocktail)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, outerGeo.size.height * 0.04)
                        }
                        .foregroundStyle(viewModel.cocktail.historicSpec == nil ? .primary : .secondary)
                        .allowsHitTesting(!viewModel.isFlipped)
                        .background(BlackGlassBackgroundView())
                        .task {
                            showSpecInMl = viewModel.findIntendedMeasurementUnit()
                        }
                        
                        GeometryReader { innerGeo in
                            
                            VStack {
                                if !viewModel.overlayPresented {
                                    Spacer()
                                }
                                
                                IngredientPrepOverlay(viewModel: viewModel)
                                    .frame(height: viewModel.overlayPresented ? innerGeo.size.height : 0)
                                    .animation(.spring(), value: viewModel.overlayPresented)
                            }
                            .allowsHitTesting(viewModel.overlayPresented)
                        }
                    }
                    .frame(width: outerGeo.size.width * 0.88, height: viewModel.contentSize(for: outerGeo.size.height))
                    
                    Border(height: outerGeo.size.height, gradient: viewModel.cocktail.historicSpec != nil ? $historicBorderColor : $borderColor)
                }
                .opacity(viewModel.backDegree == -90 ? 1 : 0)
                .rotation3DEffect(Angle(degrees: viewModel.frontDegree), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
}



struct SwipeRecipeView: View {
    @State var variations: [Cocktail]
    @Environment(\.dismiss) private var dismiss
    @State var borderColor = ColorScheme.presentedFrontBorder
    @State var initialSelection: Cocktail
    @State var scrollID: Cocktail.ID?
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                ScrollView(.horizontal) {
                    
                    HStack(alignment: .top) {
                        
                        ForEach(variations) { cocktail in
                            
                            RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail), borderColor: $borderColor, scrollID: $scrollID, recommendedCocktailID: getRecommendation(for: cocktail))
                                .containerRelativeFrame(.horizontal)
                                .discardTransition()
                        }
                    }
                    
                }
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $scrollID)
                .contentMargins(.bottom, 84, for: .scrollIndicators) // This will probably break on other devices but will leave it in for testing
                .scrollIndicators(.visible)
                .onScrollPhaseChange { oldPhase, newPhase in
                    withAnimation {
                        borderColor = newPhase != .interacting ? ColorScheme.presentedFrontBorder : ColorScheme.inactiveBorder
                    }
                }
                .onAppear {
                    scrollID = initialSelection.id
                    variations.forEach { cocktail in
                        print("\(cocktail.cocktailName) has id: \(cocktail.id)")
                    }
                }
            }
        }
    }
    
    func getRecommendation(for cocktail: Cocktail) -> UUID? {
        guard let historicCocktail = cocktail.historicSpec else {
            return nil }
        let recommendedSpec = variations.first { $0.cocktailName == historicCocktail.recommendedSpec }
        return recommendedSpec?.id
    }
}

struct RecipeView: View {
    
    @Bindable var viewModel: RecipeViewModel
    @State var borderColor = ColorScheme.presentedFrontBorder
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            ColorScheme.background
                .ignoresSafeArea()
            
            RecipeFlipCardView(viewModel: viewModel, borderColor: $borderColor, scrollID: .constant(UUID()))
//                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview(traits: .sampleData) {
//    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
//    
//    SwipeRecipeView(variations: cocktails ?? DummyCocktails.cocktails, initialSelection: zombie)
//        .environmentObject(CBCViewModel())
//}

/// Uncomment below to test single recipe view (instead of swipe view above)

//#Preview(traits: .sampleData) {
//    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
//
//    RecipeView(viewModel: RecipeViewModel(cocktail: ramosGinFizz))
//        .environmentObject(CBCViewModel())
//}




