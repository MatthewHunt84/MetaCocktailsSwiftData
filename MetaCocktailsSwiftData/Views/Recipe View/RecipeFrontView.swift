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
            
                ScrollViewReader { scrollReader in
                    ScrollView {
                        RecipeFlipCardView(viewModel: viewModel, scrollReader: scrollReader)
                    }
                    .contentMargins(.top, -10)
                    .scrollIndicators(.hidden)
                    .navigationBarTitleDisplayMode(.inline)
                    .recipeHeader(cocktail: viewModel.cocktail)
                }
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
                
                ScrollViewReader { scrollReader in
                    
                    ScrollView(.vertical) {
                        
                        ScrollView(.horizontal) {
                            
                            LazyHStack(alignment: .top) {
                                
                                ForEach(variations) { cocktail in
                                    
                                    RecipeFlipCardView(viewModel: RecipeViewModel(cocktail: cocktail), scrollReader: scrollReader)
                                        .containerRelativeFrame(.horizontal)
                                        .discardTransition()
                                }
                            }
                            .scrollTargetLayout()
                            
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.visible)
                        .scrollIndicatorsFlash(onAppear: true)
                        .scrollPosition(id: $scrollID)
                        .scrollClipDisabled()
                    }
                    .contentMargins(.top, -10, for: .scrollContent)
                    .scrollIndicators(.hidden)
                    
                }
            }
            .recipeHeader(cocktail: variations.first(where: { $0.id == scrollID }))
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return IngredientRecipeView(prep: PrepBible.pineappleGommeSyrup, viewModel: RecipeViewModel(cocktail: mintJulep))
        .modelContainer(preview.container)
}

