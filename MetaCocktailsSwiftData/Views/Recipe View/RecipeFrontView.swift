//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI
import SwiftData


struct RecipeFlipCardView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingCocktailNotes = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    @Binding var borderColor: BorderGradient
    @Binding var scrollID: Cocktail.ID?
    @State var historicBorderColor = ColorScheme.inactiveBorder
    @State private var overlayPresented = false
    @State private var showingHistoricInfo = false
    var recommendedCocktailID: UUID? = nil
    
    var body: some View {
        
        GeometryReader { outerGeo in
            
            ZStack {
                
                RecipeViewBack(viewModel: viewModel, parentGeo: outerGeo)
                
                ZStack {
                    
                    BackgroundGlowAnimation(gradient: viewModel.cocktail.historicSpec != nil ? historicBorderColor.top : borderColor.top, isFavorite: $viewModel.cocktail.favorite)
                    
                    ZStack {
                        
                        FadingEdgesScrollView {
                            
                            VStack(alignment: .leading, spacing: 20) {
                                
                                VStack(spacing: 0) {
                                    
                                    HStack {
                                        
                                        Button(action: {
                                            dismiss()
                                        }) {
                                            Image(systemName: "chevron.backward")
                                                .font(.system(size: 24))
                                                .foregroundStyle(ColorScheme.interactionTint)
                                        }
                                        
                                        Spacer()
                                        
                                        FontFactory.recipeHeader(title: viewModel.cocktail.cocktailName, isHistoric: viewModel.cocktail.collection == .originals)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                        
                                        FavoriteButton(for: viewModel.cocktail)
                                    }
                                    
                                    if let _ = viewModel.cocktail.variation, let recipeSubheading = viewModel.cocktail.collection?.recipeSubheading {
                                        FontFactory.historicText(recipeSubheading, size: 18, color: .secondary)
                                    }
                                }
                                
                                if recommendedCocktailID != nil {
                                    
                                    VStack {
                                        
                                        HStack {
                                            Text("~")
                                            Text("Historical Recipe")
                                                .lineLimit(1)
                                            Button {
                                                withAnimation(.bouncy) {
                                                    showingHistoricInfo.toggle()
                                                }
                                            } label: {
                                                Image(systemName: "info.circle.fill")
                                                    .tint(ColorScheme.interactionTint)
                                                    .foregroundStyle(ColorScheme.interactionTint)
                                                    .font(.system(size: 14))
                                                    .padding(.bottom, 10)
                                                    .padding(.leading, 4)
                                                
                                            }
                                            Text("~")
                                        }
                                        .font(.custom("Zapfino", size: 20))
                                        .foregroundStyle(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        //                                        .background(.teal.opacity(0.5))
                                        
                                        if showingHistoricInfo {
                                            
                                            VStack {
                                                
                                                Text(HistoricText)
                                                    .font(FontFactory.italicFont(size: 16))
                                                    .multilineTextAlignment(.center)
                                                //                                                .background(.pink.opacity(0.5))
                                                UniversalButton(buttonText: "Recommended Spec", includeBorder: true, color: ColorScheme.recipeBorder) {
//                                                    print("ACTION existing id is: \(scrollID)")
                                                    withAnimation(.bouncy) {
                                                        scrollID = recommendedCocktailID
                                                    }
//                                                    print("ACTION new id is: \(scrollID)")
                                                    
                                                    //                                                    overlayPresented.toggle()
                                                }
                                            }
                                            .transition(.move(edge: .top).combined(with: .blurReplace))
//                                            .transition(.blurReplace)
                                        }
                                    }
                                }
                                
                                GlasswareView(cocktail: viewModel.cocktail)
                                
                                SpecView(cocktail: viewModel.cocktail, viewModel: viewModel, isShowingCocktailNotes: $isShowingCocktailNotes)
                                
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
                        }
                        .foregroundStyle(viewModel.cocktail.collection == .originals ? .secondary : .primary)
                        .scrollIndicators(.hidden)
                        .allowsHitTesting(!viewModel.isFlipped)
                        .background(BlackGlassBackgroundView())
                        
                        
                        GeometryReader { innerGeo in
                            VStack {
                                if !overlayPresented {
                                    Spacer()
                                }
                                HistoricalCocktailModalView(
                                    cocktail: viewModel.cocktail,
                                    presented: $overlayPresented
                                ) { overlayPresented.toggle() }
                                    .frame(height: overlayPresented ? innerGeo.size.height : 0)
                                    .animation(.spring(), value: overlayPresented)
                            }
                            .allowsHitTesting(overlayPresented)
                        }
                    }
                    .frame(width: outerGeo.size.width * 0.88, height: viewModel.contentSize(for: outerGeo.size.height))
                    
                    Border(height: outerGeo.size.height, gradient: viewModel.cocktail.historicSpec != nil ? $historicBorderColor : $borderColor)
                    
                    if isShowingCocktailNotes {
                        if let notes = viewModel.cocktail.notes {
                            CustomAlertView(isActive: $isShowingCocktailNotes, title: "Note:", message: notes , buttonTitle: "Yes, chef.") {}
                                .zIndex(1)
                        }
                    }
                }
                .opacity(viewModel.backDegree == -90 ? 1 : 0)
                .rotation3DEffect(Angle(degrees: viewModel.frontDegree), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
    
    let HistoricText = "Although historically accurate, this recipe has improved with time."
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
//                    print("current id is: \(scrollID)")
                }
                
            }
//                        .recipeHeader(cocktail: variations.first(where: { $0.id == scrollID }))
        }
    }
    
    func getRecommendation(for cocktail: Cocktail) -> UUID? {
        guard let historicCocktail = cocktail.historicSpec else {
            print("--- no historic spec found for \(cocktail.cocktailName)")
            return nil }
        let recommendedSpec = variations.first { $0.cocktailName == historicCocktail.recommendedSpec }
        print("---is recommendation exist? \(recommendedSpec?.id)")
        return recommendedSpec?.id
    }
    
//    func getID() -> UUID? {
//        if let found = variations.last {
//            return found.id
//        }
//        return nil
//    }
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
                .navigationBarTitleDisplayMode(.inline)
            //                .recipeHeader(cocktail: viewModel.cocktail)
        }
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    
    SwipeRecipeView(variations: cocktails ?? DummyCocktails.cocktails, initialSelection: zombie)
        .environmentObject(CBCViewModel())
}

/// Uncomment below to test single recipe view (instead of swipe view above)

//#Preview(traits: .sampleData) {
//    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
//
//    RecipeView(viewModel: RecipeViewModel(cocktail: ramosGinFizz))
//        .environmentObject(CBCViewModel())
//}
