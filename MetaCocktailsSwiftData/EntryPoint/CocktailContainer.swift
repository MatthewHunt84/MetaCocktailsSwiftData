//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import SwiftUI
import SwiftData


actor CocktailContainer {
    
    static func useSwiftDataFile()  -> ModelContainer {
        
        do {
            guard let bundleURL = Bundle.main.url(forResource: "default", withExtension: "store") else {
                fatalError("💀 Error: Failed to find SwiftData default.store in app bundle - we can't run without it")
            }

            let fileManager = FileManager.default
            let documentDirectoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let documentURL = documentDirectoryURL.appendingPathComponent("default.store")
            
            if !fileManager.fileExists(atPath: documentURL.path) {
                print("✅ First Launch: Copying bundled sqlite file to documents")
                try fileManager.copyItem(at: bundleURL, to: documentURL)
            } else {
                print("✅ Local SwiftData file found")
            }
            
            let schema = Schema([Cocktail.self])
            
            let configuration = ModelConfiguration(url: documentURL)
            let container = try! ModelContainer(for: schema, configurations: configuration)
            return container
            
        } catch {
            fatalError("💀 Error: \(error)")
        }
    }
    
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
                    
                    // We also need to do the same for garnishes (so we don't violate the #unique name declaration)
                    var garnishArray = [Garnish]()
                    
                    cocktail.garnish.forEach { garnish in
                        
                        let fetchDescriptor = FetchDescriptor<Garnish>(predicate: #Predicate { $0.name == garnish.name } )
                        let existingGarnish = try? container.mainContext.fetch(fetchDescriptor).first
                        
                        if let foundGarnish = existingGarnish {
                            garnishArray.append(foundGarnish)
                        } else {
                            garnishArray.append(garnish)
                        }
                    }
                    
                    cocktail.garnish = garnishArray
                    
                    // Add cocktail to context
                    
                    container.mainContext.insert(cocktail) }
            
            // Save context to container
        }
    }
}
