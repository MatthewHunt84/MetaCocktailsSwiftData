//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import SwiftUI
import SwiftData


actor CocktailContainer {
    
    @MainActor
    static func preload(_ shouldPreload: inout Bool) -> ModelContainer {
        let schema = Schema([Cocktail.self])
        let config = ModelConfiguration()
        var newIngredients: [Ingredient] = []
        
        do {
            let container = try ModelContainer(for: schema, configurations: config)
            
            if shouldPreload {
                print("🕔🕔🕔 PRELOADING COCKTAILS FOR FIRST TIME LAUNCH 🕔🕔🕔")
                
                    // container.mainContext.insert(aloeForThatBurn)
                
                let _ = Preload.allCases.map { $0.cocktails }
                    .flatMap { $0 }
                    .map { container.mainContext.insert($0) }
//                let newModelArray: [Ingredient] = createNewModelArray()
                
                let allCocktails = Preload.allCases.map { $0.cocktails }
                    .flatMap { $0 }
                
                for cocktail in allCocktails {
                    for ingredient in cocktail.spec {
                        if ingredient.ingredient.category == "Vodka"{
                            //                let category = Switch ingredient type to get category and name. The switch will only have one case
                            // I couldn't figure out how to do the switch statement on IngredientType. 😔
                            newIngredients.append(Ingredient(ingredient.ingredient.name,
                                                             ingredientCategory: IngredientCategory.vodkas,
                                                             tagsWithSubcategories: ingredient.ingredient.tags,
                                                             value: ingredient.value,
                                                             unit: ingredient.unit,
                                                             prep: ingredient.prep))
                        }
                    }
                }
                for ingredient in newIngredients {
                    print("Ingredient is \(ingredient.name), value is \(ingredient.value)")
                }
                
                shouldPreload = false
            } else {
                print("✅✅✅ COCKTAILS LOADED FROM DATABASE ✅✅✅")
            }
            return container
            
        } catch {
            fatalError("💀💀💀 MODEL CONTAINER FAILED TO INITIALIZE 💀💀💀")
        }
        // MARK: FUNCTION FOR COCKTAIL CONVERSION
        
        
        
    }
    // MARK: We can't reference this function within the preload function.
    func createNewModelArray() -> [Ingredient]{
        // return an array of new model objects, but only for the first case just to make sure it works
        // get all the cocktails (line 26)
        let allCocktails = Preload.allCases.map { $0.cocktails }
            .flatMap { $0 }
        var newIngredients: [Ingredient] = []
        for cocktail in allCocktails {
            for ingredient in cocktail.spec {
                if ingredient.ingredient.category == "Vodka"{
                    
                    //                let category = Switch ingredient type to get category and name. The switch will only have one case
                    // I couldn't figure out how to do the switch statement on IngredientType. 😔
                    newIngredients.append(Ingredient(ingredient.ingredient.name,
                                                     ingredientCategory: IngredientCategory.vodkas,
                                                     tagsWithSubcategories: ingredient.ingredient.tags,
                                                     value: ingredient.value,
                                                     unit: ingredient.unit,
                                                     prep: ingredient.prep))
                }
            }
        }
        for ingredient in newIngredients {
            print("Ingredient is \(ingredient.name), value is \(ingredient.value)")
        }
        
        return newIngredients
    }
}
