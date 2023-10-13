//
//  RecipeIngredientsView.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct RecipeIngredientsView: View {
    var cocktail: Cocktail
    let recipeSpacing: CGFloat = 2
    var body: some View {
        
        Text(cocktail.cocktailName)
            .font(.title2)
        
        Text("GW: \(cocktail.glasswareType.rawValue)")
        
        ForEach(cocktail.spec) { ingredient in
            Text("\(ingredient.value, specifier: "%.2f") oz. \(ingredient.ingredient.name)")
                .padding(recipeSpacing)
        }
        
        if let garnishes = cocktail.garnish {
            ForEach(garnishes) { garnish in
                Text("G: \(garnish.name)")
            }
        }
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientsView(cocktail: aperolSpritz)
    }
}
