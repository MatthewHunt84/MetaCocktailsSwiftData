//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import Foundation
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
                
//                container.mainContext.insert(aloeForThatBurn)

                let _ = Preload.allCases.map { $0.cocktails }
                                        .flatMap { $0 }
                                        .map { container.mainContext.insert($0) }
// let newModelArray = createNewModelArray()
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
    
    func createNewModelArray() {
        // return an array of new model objects, but only for the first case just to make sure it works 
        // get all the cocktails (line 26)
        let allCocktails = Preload.allCases.map { $0.cocktails }
                                .flatMap { $0 }
                       
        let ingredientsForCocktail = allCocktails.map { $0.spec }
        
        for oldIngredient in ingredientsForCocktail {
            //ForEach map
            //let name = name
            // let measurement unit = measurement unit
            // let value = value
            // let category = Switch ingredient type to get category and name. The switch will only have one case
        }
        
    }
}
