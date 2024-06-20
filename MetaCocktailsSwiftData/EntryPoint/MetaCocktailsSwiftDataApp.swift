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
    @AppStorage("shouldPreload") private var shouldPreload: Bool = true
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .preferredColorScheme(.dark)
                //.environmentObject(ViewRouter())
        }
        .modelContainer(CocktailContainer.preload(&shouldPreload))
        .environmentObject(CBCViewModel())
    }
}
