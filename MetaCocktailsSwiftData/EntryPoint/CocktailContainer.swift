//
//  CocktailContainer.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 2/17/24.
//

import SwiftUI
import SwiftData

actor CocktailContainer {
    
    static func useSwiftDataFile()  -> ModelContainer {
        
        do {
            guard let bundleURL = Bundle.main.url(forResource: "PreloadedCocktails", withExtension: "store") else {
                fatalError("💀 Error: Failed to find SwiftData default.store in app bundle - we can't run without it")
            }

            let fileManager = FileManager.default
            let documentDirectoryURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let documentURL = documentDirectoryURL.appendingPathComponent("default.store")
            
            if !fileManager.fileExists(atPath: documentURL.path) {
                print("✅ First Launch: Copying bundled sqlite file to documents")
                try fileManager.copyItem(at: bundleURL, to: documentURL)
            } else {
                print("✅ Local SwiftData file found")
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
        static func generatePreloadedDatabase() throws {
            print("\n🔨 Starting database generation...")
            
            // Create a temporary directory
            let tempDir = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString, isDirectory: true)
            
            try FileManager.default.createDirectory(
                at: tempDir,
                withIntermediateDirectories: true
            )
            
            print("📁 Created temporary directory at: \(tempDir.path)")
            
            // Create the database file
            let dbURL = tempDir.appendingPathComponent("default.store")
            FileManager.default.createFile(atPath: dbURL.path, contents: nil)
            
            print("📄 Created empty database file")
            
            // Configure and create the container
            let schema = Schema([
                Cocktail.self,
                IngredientBase.self,
                Garnish.self
            ])
            
            let config = ModelConfiguration(url: dbURL)
            
            print("🔄 Creating container...")
            let container = try ModelContainer(for: schema, configurations: [config])
            let context = container.mainContext
            
            print("🍸 Inserting cocktails...")
            insertCocktailsIntoModel(container: container)
            
            // Force a save
            print("💾 Saving context...")
            try context.save()
            
            // Verify the file exists and has content
            guard FileManager.default.fileExists(atPath: dbURL.path),
                  let attributes = try? FileManager.default.attributesOfItem(atPath: dbURL.path),
                  let fileSize = attributes[.size] as? Int64,
                  fileSize > 0 else {
                throw NSError(domain: "DatabaseGenerator", code: 1,
                             userInfo: [NSLocalizedDescriptionKey: "Database file was not created properly"])
            }
            
            print("📊 Database file size: \(fileSize) bytes")
            
            // Copy to desktop
            let desktopURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("PreloadedCocktails.store")
            
            print("📝 Copying to desktop...")
            
            // Remove existing file if it exists
            if FileManager.default.fileExists(atPath: desktopURL.path) {
                try FileManager.default.removeItem(at: desktopURL)
            }
            
            try FileManager.default.copyItem(at: dbURL, to: desktopURL)
            
            // Verify the copy
            guard FileManager.default.fileExists(atPath: desktopURL.path) else {
                throw NSError(domain: "DatabaseGenerator", code: 2,
                             userInfo: [NSLocalizedDescriptionKey: "Failed to copy database to desktop"])
            }
            
            print("✅ Database generated successfully at: \(desktopURL.path)")
            
            // Cleanup
            try? FileManager.default.removeItem(at: tempDir)
        }
    
    @MainActor
    private static func insertCocktailsIntoModel(container: ModelContainer) {
        let context = container.mainContext
        
        // Track unique ingredient bases and garnishes
        var uniqueIngredientBases = [String: IngredientBase]()
        var uniqueGarnishes = [String: Garnish]()
        
        print("📝 Processing cocktails...")
        
        let cocktails = Preload.allCases.map { $0.cocktails }.flatMap { $0 }
        
        // First pass: collect all unique ingredient bases and garnishes
        for cocktail in cocktails {
            for ingredient in cocktail.spec {
                let baseName = ingredient.ingredientBase.name
                if uniqueIngredientBases[baseName] == nil {
                    uniqueIngredientBases[baseName] = ingredient.ingredientBase
                    context.insert(ingredient.ingredientBase)
                }
            }
            
            for garnish in cocktail.garnish {
                let garnishName = garnish.name
                if uniqueGarnishes[garnishName] == nil {
                    uniqueGarnishes[garnishName] = garnish
                    context.insert(garnish)
                }
            }
        }
        
        print("✓ Processed \(uniqueIngredientBases.count) unique ingredient bases")
        print("✓ Processed \(uniqueGarnishes.count) unique garnishes")
        
        // Second pass: create cocktails with references to existing ingredients and garnishes
        for cocktail in cocktails {
            // Update ingredient base references
            for ingredient in cocktail.spec {
                if let existingBase = uniqueIngredientBases[ingredient.ingredientBase.name] {
                    ingredient.ingredientBase = existingBase
                }
            }
            
            // Update garnish references
            var updatedGarnishes = [Garnish]()
            for garnish in cocktail.garnish {
                if let existingGarnish = uniqueGarnishes[garnish.name] {
                    updatedGarnishes.append(existingGarnish)
                }
            }
            cocktail.garnish = updatedGarnishes
            
            context.insert(cocktail)
        }
        
        print("✓ Processed \(cocktails.count) cocktails")
        
        // Try to save after each major operation
        try? context.save()
    }
    
    @MainActor
    static func preload(_ shouldPreload: inout Bool) -> ModelContainer {
        let schema = Schema([Cocktail.self])
        let config = ModelConfiguration()
        
        do {
            let container = try ModelContainer(for: schema, configurations: config)
            
            if shouldPreload {
                print("🕔🕔🕔 PRELOADING COCKTAILS FOR FIRST TIME LAUNCH 🕔🕔🕔")
                
                insertCocktailsIntoModel(container: container)
                
                shouldPreload = false
            } else {
                print("✅✅✅ COCKTAILS LOADED FROM DATABASE ✅✅✅")
            }
            return container
            
        } catch {
            fatalError("💀💀💀 MODEL CONTAINER FAILED TO INITIALIZE 💀💀💀")
        }
    }
}

@MainActor
struct CocktailDatabaseGenerator {
    static func generatePreloadedDatabase(destinationDirectory: URL) throws {
            print("\n🔨 Starting database generation...")
            
            // Create a temporary directory for generation
            let tempDir = FileManager.default.temporaryDirectory
                .appendingPathComponent(UUID().uuidString, isDirectory: true)
            
            try FileManager.default.createDirectory(
                at: tempDir,
                withIntermediateDirectories: true
            )
            
            print("📁 Created temporary directory at: \(tempDir.path)")
            
            // Create destination directory if it doesn't exist
            try FileManager.default.createDirectory(
                at: destinationDirectory,
                withIntermediateDirectories: true
            )
            
            let tempDatabaseURL = tempDir.appendingPathComponent("default.store")
            let finalDatabaseURL = destinationDirectory.appendingPathComponent("PreloadedCocktails.store")
            
            do {
                // Generate the database
                try autoreleasepool {
                    let schema = Schema([
                        Cocktail.self,
                        IngredientBase.self,
                        Garnish.self
                    ])
                    
                    let config = ModelConfiguration(url: tempDatabaseURL)
                    
                    print("🔄 Creating container...")
                    let container = try ModelContainer(for: schema, configurations: [config])
                    
                    print("🍸 Inserting cocktails...")
                    try insertCocktailsIntoModel(container: container)
                    
                    // Force a save
                    try container.mainContext.save()
                }
                
                // Small delay to ensure database is fully closed
                Thread.sleep(forTimeInterval: 0.5)
                
                print("📝 Copying database to: \(finalDatabaseURL.path)")
                
                // Remove existing file if it exists
                if FileManager.default.fileExists(atPath: finalDatabaseURL.path) {
                    try FileManager.default.removeItem(at: finalDatabaseURL)
                }
                
                // Copy all related database files
                try FileManager.default.copyItem(at: tempDatabaseURL, to: finalDatabaseURL)
                
                // Copy WAL and SHM files if they exist
                let walURL = tempDatabaseURL.appendingPathExtension("store-wal")
                let shmURL = tempDatabaseURL.appendingPathExtension("store-shm")
                
                if FileManager.default.fileExists(atPath: walURL.path) {
                    try FileManager.default.copyItem(
                        at: walURL,
                        to: finalDatabaseURL.appendingPathExtension("store-wal")
                    )
                }
                
                if FileManager.default.fileExists(atPath: shmURL.path) {
                    try FileManager.default.copyItem(
                        at: shmURL,
                        to: finalDatabaseURL.appendingPathExtension("store-shm")
                    )
                }
                
                print("✅ Database generated successfully at: \(finalDatabaseURL.path)")
                
            } catch {
                print("❌ Error during database generation: \(error)")
                throw error
            }
        }
    
    private static func insertCocktailsIntoModel(container: ModelContainer) throws {
        let context = container.mainContext
        
        // Track unique ingredient bases and garnishes
        var uniqueIngredientBases = [String: IngredientBase]()
        var uniqueGarnishes = [String: Garnish]()
        
        print("📝 Processing cocktails...")
        
        let cocktails = Preload.allCases.map { $0.cocktails }.flatMap { $0 }
        
        // First pass: collect all unique ingredient bases and garnishes
        for cocktail in cocktails {
            autoreleasepool {
                for ingredient in cocktail.spec {
                    let baseName = ingredient.ingredientBase.name
                    if uniqueIngredientBases[baseName] == nil {
                        uniqueIngredientBases[baseName] = ingredient.ingredientBase
                        context.insert(ingredient.ingredientBase)
                    }
                }
                
                for garnish in cocktail.garnish {
                    let garnishName = garnish.name
                    if uniqueGarnishes[garnishName] == nil {
                        uniqueGarnishes[garnishName] = garnish
                        context.insert(garnish)
                    }
                }
            }
        }
        
        // Save after inserting bases and garnishes
        try context.save()
        
        print("✓ Processed \(uniqueIngredientBases.count) unique ingredient bases")
        print("✓ Processed \(uniqueGarnishes.count) unique garnishes")
        
        // Second pass: create cocktails with references to existing ingredients and garnishes
        for cocktail in cocktails {
            autoreleasepool {
                // Update ingredient base references
                for ingredient in cocktail.spec {
                    if let existingBase = uniqueIngredientBases[ingredient.ingredientBase.name] {
                        ingredient.ingredientBase = existingBase
                    }
                }
                
                // Update garnish references
                var updatedGarnishes = [Garnish]()
                for garnish in cocktail.garnish {
                    if let existingGarnish = uniqueGarnishes[garnish.name] {
                        updatedGarnishes.append(existingGarnish)
                    }
                }
                cocktail.garnish = updatedGarnishes
                
                context.insert(cocktail)
            }
        }
        
        print("✓ Processed \(cocktails.count) cocktails")
        try context.save()
    }
}

extension ModelContainer {
    static func createWithPreloadedCocktails() throws -> ModelContainer {
        let schema = Schema([Cocktail.self])
        
        guard let bundledDatabaseURL = Bundle.main.url(
            forResource: "PreloadedCocktails",
            withExtension: "store"
        ) else {
            throw NSError(domain: "CocktailDatabase", code: 1,
                userInfo: [NSLocalizedDescriptionKey: "Preloaded database not found in bundle"])
        }
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            url: bundledDatabaseURL,
            allowsSave: true
        )
        
        return try ModelContainer(
            for: schema,
            configurations: [modelConfiguration]
        )
    }
}
