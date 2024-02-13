//
//  CocktailMenuViewModel.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/25/24.
//

import SwiftUI

final class CocktailMenuViewModel: ObservableObject {
    var cocktail: Cocktail
    var cocktailGlassImage: Image

    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        self.cocktailGlassImage = cocktail.glasswareType.glassImage(cocktail: cocktail)
    }
    func convertCocktailToBatch() -> [BatchIngredient] {
        //var convertedBatchIngredients: [BatchIngredient] = []
        let emptyBatch: [BatchIngredient] = []

        for ingredient in cocktail.spec {
            //convertedBatchIngredients.append(BatchIngredient(name: ingredient.ingredient.name, amount: ingredient.value, aBV: 0.0))
            CBCViewModel().ingredients.append(BatchIngredient(name: ingredient.ingredient.name, amount: ingredient.value, aBV: 0.0))
        }
        //CBCViewModel().ingredients = convertedBatchIngredients
        return emptyBatch
    }
   
}
