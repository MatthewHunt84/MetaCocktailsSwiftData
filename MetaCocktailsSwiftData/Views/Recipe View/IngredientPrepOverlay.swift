//
//  IngredientPrepOverlay.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/13/24.
//


import SwiftUI

struct IngredientPrepOverlay: View {
    
    var viewModel: RecipeViewModel
    var body: some View {
        
        FadingEdgesScrollView {
            
            IngredientRecipeView(viewModel: viewModel)
                .padding()
        }
        .background(BlackGlassBackgroundView())
    }
}

struct IngredientRecipeView: View {

    var viewModel: RecipeViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Grid(horizontalSpacing: 1) {
                
                GridRow {
                    Color.clear
                        .gridColumnAlignment(.trailing)
                        .frame(width: 50, height: 50)
                
                    
                    Text("\(viewModel.currentIngredientRecipe.prepIngredientName) recipe")
                        .font(FontFactory.mediumFont(size: 18).bold())
                        .gridColumnAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        viewModel.overlayPresented.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20))
                            .bold()
                            .tint(ColorScheme.interactionTint)
                    }
                    .frame(width: 50, height: 50)
                    .gridColumnAlignment(.leading)
                }
            }
            .padding(.bottom, 15)
            
            ForEach(viewModel.currentIngredientRecipe.prepRecipe) { build in
                HStack(alignment: .top) {
                    Text("\(build.step).")
                        .font(FontFactory.mediumFont(size: 16))
                        .bold()
                        
                    Text("\(build.method)")
                        .font(FontFactory.mediumFont(size: 16))
                }
                .foregroundStyle(.primary)
                
                Divider()
            }

            Spacer()
        }
    }
}
