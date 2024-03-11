//
//  LoadSampleCocktailsButton.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI

struct LoadSampleCocktailsButton: View {
    
    @Environment(\.modelContext) private var modelContext
    var body: some View {
        
        Button {
            modelContext.insert(TestCocktails.textCocktail1)
            modelContext.insert(TestCocktails.textCocktail2)
            modelContext.insert(TestCocktails.textCocktail3)
            modelContext.insert(TestCocktails.textCocktail4)
            modelContext.insert(TestCocktails.textCocktail5)
            modelContext.insert(TestCocktails.textCocktail6)
            modelContext.insert(TestCocktails.textCocktail7)
            modelContext.insert(TestCocktails.textCocktail8)
            modelContext.insert(TestCocktails.textCocktail9)
            modelContext.insert(TestCocktails.textCocktail10)
        } label: {
            Text("Load Samples")
        }
    }
}

#Preview {
    LoadSampleCocktailsButton()
}
