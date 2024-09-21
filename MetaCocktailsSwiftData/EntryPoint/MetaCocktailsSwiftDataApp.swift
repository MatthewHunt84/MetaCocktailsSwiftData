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
    
    init() {

//        exportSwiftDataToJSON()
    }
    
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
    
    func exportSwiftDataToJSON() {
        do {
            let container = try ModelContainer(for: Cocktail.self)
            let context = container.mainContext
            
            let fetchDescriptor = FetchDescriptor<Cocktail>(sortBy: [SortDescriptor(\.cocktailName)])
            let cocktails = try context.fetch(fetchDescriptor)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(cocktails)
            
            let fileManager = FileManager.default
            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsDirectory.appendingPathComponent("ExportedCocktails.json")
            
            try jsonData.write(to: fileURL)
            
            print("✅✅✅ JSON file created successfully.")
            print("File location: \(fileURL.path)")
        } catch {
            print("💀💀💀 Error exporting data to JSON: \(error)")
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
        
        Task {
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
                        withAnimation(.easeIn(duration: 1)) {
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
