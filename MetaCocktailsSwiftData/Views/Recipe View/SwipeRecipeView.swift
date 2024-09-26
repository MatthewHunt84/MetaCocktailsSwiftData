//
//  SwipeRecipeView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/20/24.
//

import SwiftUI
import SwiftData

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
