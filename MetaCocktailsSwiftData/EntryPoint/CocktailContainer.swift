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
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.vodkas,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .syrups:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.syrups,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .juices:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.juices,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .herbs:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.herbs,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .fruit:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.fruit,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .seasoning:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.seasoning,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .soda:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.soda,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .otherNonAlc:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.otherNonAlc,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .agaves:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.agaves,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .brandies:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.brandies,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .gins:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.gins,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .otherAlcohol:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.otherAlcohol,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .rums:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.rums,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .whiskies:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.whiskies,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .liqueurs:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.liqueurs,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .fortifiedWines:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.fortifiedWines,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .wines:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.wines,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .bitters:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.bitters,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                case .amari:
                    Ingredient($0.ingredient.name,
                               ingredientCategory: Category.amari,
                               tagsWithSubcategories: $0.ingredient.tags,
                               value: $0.value,
                               unit: $0.unit,
                               prep: $0.prep)
                }
            }
    
        for ingredient in newIngredients  {
            print("Ingredient is \(ingredient.name), category is \(ingredient.category)")
        }
        
        return newIngredients
    }
}
