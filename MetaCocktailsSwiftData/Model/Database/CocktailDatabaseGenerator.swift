//
//  CocktailDatabaseGenerator.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/17/24.
//

import SwiftUI
import SwiftData

@MainActor
struct CocktailDatabaseGenerator {
    static func generatePreloadedDatabase(destinationDirectory: URL) throws {
            print("🔨 Starting database generation...")
            
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
                
                print("✅ Database generated successfully")
                
            } catch {
                print("❌ Error during database generation: \(error)")
                throw error
            }
        }
    
    static func insertCocktailsIntoModel(container: ModelContainer) throws {
        let context = container.mainContext
        
        // Track unique ingredient bases and garnishes
        var uniqueIngredientBases = [String: IngredientBase]()
        var uniqueGarnishes = [String: Garnish]()
        
        print("Processing cocktails...")
        
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
        
        print("✅ Processed \(uniqueIngredientBases.count) unique ingredient bases")
        print("✅ Processed \(uniqueGarnishes.count) unique garnishes")
        
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
        
        print("✅ Processed \(cocktails.count) cocktails")
        try context.save()
    }
}
