//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI
import SwiftData

struct RecipeView: View {
    
    @Bindable var viewModel: RecipeViewModel
    @State var borderColor = ColorScheme.tintColor
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            ColorScheme.background
                .ignoresSafeArea()

            RecipeFlipCardView(viewModel: viewModel, borderColor: $borderColor)
                .navigationBarTitleDisplayMode(.inline)
                .recipeHeader(cocktail: viewModel.cocktail)
        }
    }
}

struct SwipeRecipeView: View {
    @State var variations: [Cocktail]
    @Environment(\.dismiss) private var dismiss
    @State var borderColor = ColorScheme.tintColor
    @State var initialSelection: Cocktail
    @State var scrollID: Cocktail.ID?
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
              
                    ScrollView(.horizontal) {
                        
                        HStack(alignment: .top) {
                            
                            ForEach(variations) { cocktail in
                                
                                RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail), borderColor: $borderColor)
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
                            borderColor = newPhase != .interacting ? ColorScheme.tintColor : Color.secondary
                        }
                    }
                    .onAppear {
                        scrollID = initialSelection.id
                    }
            
            }
            .recipeHeader(cocktail: variations.first(where: { $0.id == scrollID }))
        }
    }
}


struct RecipeFlipCardView: View {
    @State private var isShowingCocktailNotes = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    @Binding var borderColor: Color
    
    var body: some View {
        
        GeometryReader { outerGeo in
            
            ZStack {

                RecipeViewBack(viewModel: viewModel, parentGeo: outerGeo)
                
                ZStack {
                    
                    BackgroundGlowAnimation(color: Color.redGold)
                    
                    Border(height: outerGeo.size.height, color: $borderColor)
                    
                    ScrollView {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            GlasswareView(cocktail: viewModel.cocktail)
                            
                            SpecView(cocktail: viewModel.cocktail, viewModel: viewModel, isShowingCocktailNotes: $isShowingCocktailNotes)
                            
                            GarnishView(cocktail: viewModel.cocktail)
                            
                            MethodIceView(cocktail: viewModel.cocktail, methodText: viewModel.methodString)
                            
                            if viewModel.cocktail.buildOrder != nil {
                                UniversalBlueButton(buttonText: "Build Order", rightImage: nil, leftImage: nil, includeBorder: true) {
                                    viewModel.flipCard()
                                }
                                .disabled(viewModel.isFlipped)
                            }
                            
                            if viewModel.cocktail.author != nil {
                                AuthorView(cocktail: viewModel.cocktail)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                            }
                            
                            HStack {
                                Spacer()
                                FavoriteButton(for: viewModel.cocktail)
                            }
                            .padding(.bottom, 16)
                            .padding(.trailing, 16)
                        }
                        .padding()
                    }
                    .frame(width: outerGeo.size.width * 0.88, height: viewModel.contentSize(for: outerGeo.size.height))
                    .scrollIndicators(.hidden)
                    .allowsHitTesting(!viewModel.isFlipped)
                    
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
