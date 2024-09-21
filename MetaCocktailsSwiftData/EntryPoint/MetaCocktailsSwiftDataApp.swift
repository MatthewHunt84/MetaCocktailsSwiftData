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
        importJSONToSwiftData(&shouldPreload)
//        exportSwiftDataToJSON()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .modelContainer(for: Cocktail.self)
                .modelContainer(CocktailContainer.preload(&shouldPreload))
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
    
    func importJSONToSwiftData(_ shouldPreload: inout Bool) {
        guard shouldPreload else { return }
        let modelImportStartTime = CACurrentMediaTime()
        
        let fileManager = FileManager.default
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let storePath = documentsPath.appendingPathComponent("Default.store")

        
        // Load JSON data from the app bundle
        guard let jsonURL = Bundle.main.url(forResource: "Cocktails", withExtension: "json"),
              let jsonData = try? Data(contentsOf: jsonURL) else {
            print("Failed to load Cocktails.json file")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let cocktails = try decoder.decode([Cocktail].self, from: jsonData)
            let container = try ModelContainer(for: Cocktail.self)
            let context = container.mainContext
            
            for cocktail in cocktails {
                
                cocktail.spec.forEach { ingredient in
                    
                    let fetchDescriptor = FetchDescriptor<IngredientBase>(predicate: #Predicate { $0.name == ingredient.ingredientBase.name } )
                    let existingBase = try? container.mainContext.fetch(fetchDescriptor).first
                    // see if ingredientbase exists in model
                    
                    if let base = existingBase {
                        // if yes - use existing ingredientbase
                        ingredient.ingredientBase = base
                    }
                    // if no - add base as usual
                }
                
                // We also need to do the same for garnishes (so we don't violate the #unique name declaration)
                var garnishArray = [Garnish]()
                
                cocktail.garnish.forEach { garnish in
                    
                    let fetchDescriptor = FetchDescriptor<Garnish>(predicate: #Predicate { $0.name == garnish.name } )
                    let existingGarnish = try? container.mainContext.fetch(fetchDescriptor).first
                    
                    if let foundGarnish = existingGarnish {
                        garnishArray.append(foundGarnish)
                    } else {
                        garnishArray.append(garnish)
                    }
                }
                
                cocktail.garnish = garnishArray

                context.insert(cocktail)
                print("Added: \(cocktail.cocktailName)")
            }
            
            try context.save()
            shouldPreload = false
            print("🕔Loading Time: \(CACurrentMediaTime() - modelImportStartTime)")
            print("✅ Cocktails imported from JSON successfully. (🕔Loading Time: \(CACurrentMediaTime() - modelImportStartTime))")
            
        } catch {
            print("💀 Failed to import cocktails: \(error)")
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
