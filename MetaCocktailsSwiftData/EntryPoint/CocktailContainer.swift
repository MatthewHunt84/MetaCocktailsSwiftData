//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import SwiftUI
import SwiftData

actor CocktailContainer {
    
    static func makeSwiftDataStore() -> ModelContainer {
        
        // To generate a new Swift Data Store
        // Make sure you are about to run on a new simulator which doesn't have the app loaded on it yet.
        // Uncomment the lines below and run the generateNewDatabase test.
        // Once this completes, open the file directory which gets printed in the console, and replace the "PreloadedCocktails.store" file in the Database folder
        // Then comment out these lines again
       
//        let schema = Schema([Cocktail.self])
//        let config = ModelConfiguration()
//        let container = try! ModelContainer(for: schema, configurations: config)
//        return container
        
        do {
            guard let bundleURL = Bundle.main.url(forResource: "PreloadedCocktails", withExtension: "store") else {
                fatalError("💀 Error: Failed to find PreloadedCocktails file in app bundle - we can't run without it")
                // If we hit this, it probably means we tried to generate a new database without uncommenting the lines above first.
            }

            let fileManager = FileManager.default
            let documentDirectoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let documentURL = documentDirectoryURL.appendingPathComponent("default.store")
            
            if !fileManager.fileExists(atPath: documentURL.path) {
                print("✅ First Launch: Copying bundled sqlite file to documents")
                try fileManager.copyItem(at: bundleURL, to: documentURL)
            } else {
                print("✅ Using Existing SwiftData file")
            }
            
            let schema = Schema([Cocktail.self])
            
            let configuration = ModelConfiguration(url: documentURL)
            let container = try! ModelContainer(for: schema, configurations: configuration)
            return container
            
        } catch {
            fatalError("💀 Error: \(error)")
        }
    }
    
    @MainActor
    static func testModelChanges() -> ModelContainer {
        let schema = Schema([Cocktail.self])
        let config = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: config)
        do {
            
            try CocktailDatabaseGenerator.insertCocktailsIntoModel(container: container)
            
        } catch {
            print("❌ Generate model for testing FAILED!")
        }
        print("✅  Generate model for testing MUCH SUCCESS!")
        return container
        
    }
}
