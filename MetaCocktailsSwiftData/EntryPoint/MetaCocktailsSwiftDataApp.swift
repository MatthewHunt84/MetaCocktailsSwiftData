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
                .preferredColorScheme(.dark)
                .modelContainer(CocktailContainer.preload(&shouldPreload))
                //.modelContainer(CocktailContainer.useSwiftDataFile())
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
    private var loadingStartTime: Date?
    
    init() {
        loadingStartTime = Date()
    }
    
    func setDataReady() {
        isDataReady = true
        let elapsedTime = Date().timeIntervalSince(loadingStartTime ?? Date())
        let remainingTime = max(2.0 - elapsedTime, 0)
        
        Task {
            try? await Task.sleep(for: .seconds(remainingTime))
            await MainActor.run {
                showMainContent = true
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var appState: AppState
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
                        withAnimation(.easeInOut(duration: 2)) {
                            swiftDataIsLoaded = true
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
