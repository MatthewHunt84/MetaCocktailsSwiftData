//
//  MetaCocktailsSwiftDataApp.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/7/23.
//

import SwiftData
import SwiftUI


@main
struct MetaCocktailsSwiftDataApp: App {
    var criteria = SearchCriteriaViewModel()
    @AppStorage("shouldPreload") private var shouldPreload: Bool = true
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(criteria)
                .preferredColorScheme(.dark)
        }
        .modelContainer(CocktailContainer.preload(&shouldPreload))
    }
}
