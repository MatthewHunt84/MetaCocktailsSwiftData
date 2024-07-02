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
        
        do {
            let container = try ModelContainer(for: schema, configurations: config)
            
            if shouldPreload {
                print("🕔🕔🕔 PRELOADING COCKTAILS FOR FIRST TIME LAUNCH 🕔🕔🕔")
                
                
                let _ = Preload.allCases.map { $0.cocktails }
                    .flatMap { $0 }
                    .map { container.mainContext.insert($0) }
                
                let arrayOfNewIngredientsThatOnlyMatchesVodkaAndLabelsEverythingElseAsSyrup = CocktailContainer.createNewModelArray()
                
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

    static func createNewModelArray() -> [Ingredient] {
        let newIngredients: [Ingredient] = Preload.allCases
            .map { $0.cocktails }
            .flatMap { $0 }
            .map { $0.spec }
            .flatMap { $0 }
            .map {
                switch $0.ingredient {
                case .vodkas:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.vodkas,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                default:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.syrups,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                }
            }
    
        for ingredient in newIngredients where ingredient.category == .vodkas {
            print("Ingredient is \(ingredient.name), category is \(ingredient.category)")
        }
        
        return newIngredients
    }
}
