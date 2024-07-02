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
                
                let arrayOfNewIngredients = CocktailContainer.createNewModelArray()
                
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
                    Ingredient(oldIngredient: $0)
                case .syrups:
                    Ingredient(oldIngredient: $0)
                case .juices:
                    Ingredient(oldIngredient: $0)
                case .herbs:
                    Ingredient(oldIngredient: $0)
                case .fruit:
                    Ingredient(oldIngredient: $0)
                case .seasoning:
                    Ingredient(oldIngredient: $0)
                case .soda:
                    Ingredient(oldIngredient: $0)
                case .otherNonAlc:
                    Ingredient(oldIngredient: $0)
                case .agaves:
                    Ingredient(oldIngredient: $0)
                case .brandies:
                    Ingredient(oldIngredient: $0)
                case .gins:
                    Ingredient(oldIngredient: $0)
                case .otherAlcohol:
                    Ingredient(oldIngredient: $0)
                case .rums:
                    Ingredient(oldIngredient: $0)
                case .whiskies:
                    Ingredient(oldIngredient: $0)
                case .liqueurs:
                    Ingredient(oldIngredient: $0)
                case .fortifiedWines:
                    Ingredient(oldIngredient: $0)
                case .wines:
                    Ingredient(oldIngredient: $0)
                case .bitters:
                    Ingredient(oldIngredient: $0)
                case .amari:
                    Ingredient(oldIngredient: $0)
                }
            }
    
        for ingredient in newIngredients  {
            print("Ingredient is \(ingredient.name), category is \(ingredient.category)")
        }
        
        return newIngredients
    }
}
