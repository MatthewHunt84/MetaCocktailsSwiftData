//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/15/24.
//

import Foundation
import SwiftData

actor CocktailContainer {
    
    @MainActor
    static func createAndPreload(isFirstTimeLaunch: inout Bool) -> ModelContainer {
        let schema = Schema([Cocktail.self])
        let config = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: config)
        
        if isFirstTimeLaunch {
            // pulling from CocktailListViewModel for now cause I'm lazy, but all the preload operations should be moved here to free up the views and reduce the strain on the viewModels
            for cocktail in CocktailListViewModel.getBartenderViewCocktails().flatMap({$0.cocktailVariations}) {
                container.mainContext.insert(cocktail)
            }
            isFirstTimeLaunch = false
        }
        
        return container
    }
}
