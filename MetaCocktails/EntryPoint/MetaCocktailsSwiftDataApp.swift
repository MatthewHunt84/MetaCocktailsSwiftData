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
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(criteria)
        }
    }
}
