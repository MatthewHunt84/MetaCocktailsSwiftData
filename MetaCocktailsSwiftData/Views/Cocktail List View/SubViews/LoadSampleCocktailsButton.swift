//
//  LoadSampleCocktailsButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.

import SwiftUI

struct LoadSampleCocktailsButton: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        Button(action: loadSamples) {
            Text("Load Samples")
        }
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func loadSamples() {
        let sampleCocktails = [
            TestCocktails.textCocktail56,
            TestCocktails.textCocktail25,
            TestCocktails.textCocktail1,
            TestCocktails.textCocktail2
        ]
        
        for (index, cocktail) in sampleCocktails.enumerated() {
            do {
                modelContext.insert(cocktail)
                try modelContext.save()
                print("Successfully inserted cocktail \(index + 1)")
            } catch {
                print("Error inserting cocktail \(index + 1): \(error)")
                errorMessage += "Error with cocktail \(index + 1): \(error.localizedDescription)\n"
            }
        }
        
        if !errorMessage.isEmpty {
            showError = true
        } else {
            print("All sample cocktails loaded successfully")
        }
    }
}
