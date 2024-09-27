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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            ColorScheme.background
                .ignoresSafeArea()

            RecipeFlipCardView(viewModel: viewModel)
                .navigationBarTitleDisplayMode(.inline)
                .recipeHeader(cocktail: viewModel.cocktail)
        }
    }
}

struct SwipeRecipeView: View {
    @State var variations: [Cocktail]
    @State private var selectedIndex: Int
    @Environment(\.dismiss) private var dismiss
    @State private var scrollID: Cocktail.ID?
    
    init(variations: [Cocktail], initialSelection: Cocktail) {
        self._variations = State(initialValue: variations)
        self._selectedIndex = State(initialValue: variations.firstIndex(of: initialSelection) ?? 0)
        self._scrollID = State(initialValue: initialSelection.id)
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                ScrollView(.horizontal) {
                    
                    LazyHStack(alignment: .top) {
                        
                        ForEach(variations) { cocktail in
                            
                            RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail))
                                .containerRelativeFrame(.horizontal)
                                .discardTransition()
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $scrollID)
                .contentMargins(.bottom, 84, for: .scrollIndicators) // This will probably break on other devices but will leave it in for testing
                .scrollIndicators(.visible)
            }
            .recipeHeader(cocktail: variations.first(where: { $0.id == scrollID }))
        }
    }
}



struct RecipeFlipCardView: View {
    @State private var isShowingCocktailNotes = false
    @EnvironmentObject var cBCViewModel: CBCViewModel
    @Bindable var viewModel: RecipeViewModel
    @State var glowTrigger = false
    
    var body: some View {
        
        GeometryReader { outerGeo in
            
            ZStack {

                RecipeViewBack(viewModel: viewModel, parentGeo: outerGeo)
                
                ZStack {
                    
                    Border(height: outerGeo.size.height)
                    
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
                    .background(Color.pink.opacity(0.2))
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
                
                Text("SIZE: \(outerGeo.size.height)")
                    .font(.system(size: 30))
                    .foregroundStyle(.green)
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
