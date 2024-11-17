//
//  MetaCocktailsSwiftDataTests.swift
//  MetaCocktailsSwiftDataTests
//
//  Created by Matt Hunt on 11/9/24.
//

import Foundation
import Testing
import SwiftData

@testable import MetaCocktailsSwiftData

@MainActor
@Test func generateNewDatabase() throws {

    // Get a usable directory from the test bundle
    let fileManager = FileManager.default
    let tempDirectory = fileManager.temporaryDirectory
        .appendingPathComponent("CocktailDatabaseTest-\(UUID().uuidString)")
    
    // Ensure the directory exists
    try fileManager.createDirectory(
        at: tempDirectory,
        withIntermediateDirectories: true
    )
    
    print("✅ Test directory created at: \(tempDirectory.path)")
    
    // Generate the database
    try CocktailDatabaseGenerator.generatePreloadedDatabase(destinationDirectory: tempDirectory)
    
    // Small delay to ensure files are fully written
    Thread.sleep(forTimeInterval: 0.5)
    
    // Verify the database in a separate context
    try autoreleasepool {
        let databaseURL = tempDirectory.appendingPathComponent("PreloadedCocktails.store")
        
        // Verify file exists
        #expect(fileManager.fileExists(atPath: databaseURL.path),
                "✅ Generated database file should exist at \(databaseURL.path)")
        
        // Verify file size
        let attributes = try fileManager.attributesOfItem(atPath: databaseURL.path)
        let fileSize = attributes[.size] as? Int64 ?? 0
        
        #expect(fileSize > 0, "Database file should have content (current size: \(fileSize) bytes)")
        
        // Try to load the database to verify it's valid
        let schema = Schema([Cocktail.self, IngredientBase.self, Garnish.self])
        let config = ModelConfiguration(url: databaseURL)
        let container = try ModelContainer(for: schema, configurations: [config])
        
        // Try to fetch some data to verify it's readable
        let context = container.mainContext
        let fetchDescriptor = FetchDescriptor<Cocktail>()
        let cocktails = try context.fetch(fetchDescriptor)
        
        #expect(!cocktails.isEmpty, "Should have cocktails in the database")
        print("✅ Successfully verified database with \(cocktails.count) cocktails")
        
        // Just do a final save before closing
        try context.save()
        
        // If test passes, copy the database to the project directory
        if cocktails.count > 0 {
            let projectDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent("PreloadedCocktails.store")
            
            try? fileManager.copyItem(at: databaseURL, to: projectDirectory)
            print("✅ Copied working database to: \(projectDirectory.path)")
            print("⚠️  Don't forget to re-comment out the code in CocktailContainer.makeSwiftDataStore() after copying the file into the database folder ⚠️")
        }
    }
    
    // Cleanup
    try? fileManager.removeItem(at: tempDirectory)
}

