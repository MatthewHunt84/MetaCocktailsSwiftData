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
    @StateObject private var appState = AppState()
    @AppStorage("shouldPreload") private var shouldPreload: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(CocktailContainer.useSwiftDataFile()) // turn me off to repopulate model
//                .modelContainer(CocktailContainer.preload(&shouldPreload)) // turn me on to repopulate model
                .preferredColorScheme(.dark)
                .environmentObject(CBCViewModel())
                .environmentObject(CocktailListViewModel())
                .environmentObject(appState)
        }
    }
}

@MainActor
class AppState: ObservableObject {
    @Published var isDataReady = false
    @Published var showMainContent = false
    
    func setDataReady() {
        isDataReady = true
        
        Task {
            try? await Task.sleep(for: .seconds(1))  
            await MainActor.run {
                showMainContent = true
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.modelContext) var modelContext
    @State private var swiftDataIsLoaded = false
    
    var body: some View {
        ZStack {
            if swiftDataIsLoaded {
                TabBarView()
            } else {
                FirstLaunchLoadingView()
            }
        }
        .onChange(of: appState.showMainContent) { _, newValue in
            Task {
                if newValue {
                    await MainActor.run {
                        withAnimation(.easeIn(duration: 1)) {
                            swiftDataIsLoaded = true
//                            print("Default.store file location: \(modelContext.sqliteCommand)")
                        }
                    }
                }
            }
        }
    }
}

extension ModelContext {
    var sqliteCommand: String {
        if let url = container.configurations.first?.url.path(percentEncoded: false) {
            "sqlite3 \"\(url)\""
        } else {
            "No SQLite database found."
        }
    }
}
