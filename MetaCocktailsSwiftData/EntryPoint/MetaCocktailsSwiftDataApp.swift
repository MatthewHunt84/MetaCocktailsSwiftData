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
    @StateObject private var appState = AppState()
    
    init() {
        do {
            let swiftDataStore = Bundle.main.url(forResource: "default", withExtension: "store")!
            container = try ModelContainer(for: Cocktail.self, configurations: ModelConfiguration(url: swiftDataStore))
        } catch {
            fatalError("oh nooooo!! There's no model whaaaa")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if appState.isDataReady {
                TabBarView()
                    .preferredColorScheme(.dark)
            } else {
                LoadingView()
                    .preferredColorScheme(.dark)
            }
        }
        .modelContainer(container)
        .environmentObject(CBCViewModel())
        .environmentObject(appState)
    }
}

@MainActor class AppState: ObservableObject {
    @Published var isDataReady = false
}

struct LoadingView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            ProgressView()
            Text("Pretend there's a cool loading indicator here..")
        }
        .onAppear {
            Task {
                await prepareData()
            }
        }
    }
    
    @MainActor
    private func prepareData() async {
        // Perform a simple query to ensure the store is ready
        let _ = try? modelContext.fetch(FetchDescriptor<Cocktail>())
        
        // If we get here without crashing, the store is ready
        appState.isDataReady = true
    }
}
