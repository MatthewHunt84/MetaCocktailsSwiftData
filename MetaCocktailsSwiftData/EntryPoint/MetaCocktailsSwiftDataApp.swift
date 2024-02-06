//
//  MetaCocktailsSwiftDataApp.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/7/23.
//

import SwiftUI
import SwiftData

@main
struct MetaCocktailsSwiftDataApp: App {
    var criteria = SearchCriteriaViewModel()
    var cocktailBC = CBCViewModel()
    let container: ModelContainer = {
        let schema = Schema([BatchedCocktail.self, BatchIngredient.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(criteria)
                .environmentObject(cocktailBC)
                .preferredColorScheme(.dark)
        }
        //.modelContainer(for: Cocktail.self)
        .modelContainer(container)
        //.modelContainer(for: BatchIngredient.self)
    }
}
