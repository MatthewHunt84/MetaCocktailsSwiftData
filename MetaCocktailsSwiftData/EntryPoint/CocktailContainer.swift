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
            guard let bundleURL = Bundle.main.url(forResource: "default", withExtension: "store") else {
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
}
