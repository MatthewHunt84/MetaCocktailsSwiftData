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
    let container: ModelContainer
    
    init() {
        self.container = CocktailContainer.makeSwiftDataStore()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
                .preferredColorScheme(.dark)
                .environmentObject(CBCViewModel())
                .environmentObject(CocktailListViewModel(container: container))
        }
    }
}

struct ContentView: View {

    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: CocktailListViewModel
    
    @State private var swiftDataIsLoaded = false
    @State private var startTime = CFAbsoluteTimeGetCurrent()
    
    var body: some View {
        ZStack {
            TabBarView().opacity(viewModel.cocktailFetchCompleted ? 1 : 0)
            FirstLaunchLoadingView().opacity(viewModel.cocktailFetchCompleted ? 0 : 1).allowsHitTesting(false)
        }
    }
}
