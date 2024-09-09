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
                
                insertCocktailsIntoModel(container: container)
                
                shouldPreload = false
            } else {
                print("✅✅✅ COCKTAILS LOADED FROM DATABASE ✅✅✅")
            }
            return container
            
        } catch {
            fatalError("💀💀💀 MODEL CONTAINER FAILED TO INITIALIZE 💀💀💀")
        }
        
        func insertCocktailsIntoModel(container: ModelContainer) {
            // loop over cocktails
            
            let _ = Preload.allCases.map { $0.cocktails }
                .flatMap { $0 }
                .map { cocktail in
            
            // look at each cocktail's spec (array of ingredients)
                    cocktail.spec.forEach { ingredient in

                        let fetchDescriptor = FetchDescriptor<IngredientBase>(predicate: #Predicate { $0.name == ingredient.ingredientBase.name } )
                        let existingBase = try? container.mainContext.fetch(fetchDescriptor).first
                        // see if ingredientbase exists in model
                        
                        if let base = existingBase {
                            // if yes - use existing ingredientbase
                            ingredient.ingredientBase = base
                        }
                        // if no - add base as usual
                    }
            
            // Add cocktail to context
                    
                    container.mainContext.insert(cocktail) }
            
            // Save context to container
        }
    }
    
    static func useSwiftDataFile()  -> ModelContainer {
        do {
            let storeURL = Bundle.main.url(forResource: "default", withExtension: "store")!
            return try ModelContainer(for: Cocktail.self, configurations: ModelConfiguration(url: storeURL))
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
}
