//
//  PrepBibleViewModel.swift
//  MetaCocktails
//
//  Created on 4/8/25.
//

import SwiftUI
import SwiftData
import Observation

@Observable final class PrepBibleViewModel: ObservableObject {

    private var cachedPrepRecipes: [Prep] = []
    var searchText = ""
    var filteredPrepRecipes: [Prep] = []
    var prepAlphabet: [String] = []
    var organizedPrepRecipes: [String: [Prep]] = [:]
    var dataLoaded = false
    
 
    func loadPrepRecipes(from ingredientBases: [IngredientBase]) {
        
        if dataLoaded && !cachedPrepRecipes.isEmpty {
            return
        }
        
        var uniquePreps: [Prep] = []
        var seenPrepNames = Set<String>()
        
        for base in ingredientBases {
            if let prep = base.prep, !seenPrepNames.contains(prep.prepIngredientName) {
                uniquePreps.append(prep)
                seenPrepNames.insert(prep.prepIngredientName)
            }
        }
        
        uniquePreps.sort { $0.prepIngredientName < $1.prepIngredientName }
        
        cachedPrepRecipes = uniquePreps
        filteredPrepRecipes = uniquePreps
        generateAlphabet()
        organizePrepRecipes()
        dataLoaded = true
    }
    
    func updateSearch(_ query: String) {
        searchText = query
        
        if query.isEmpty {
            filteredPrepRecipes = cachedPrepRecipes
        } else {
            filteredPrepRecipes = cachedPrepRecipes.filter {
                $0.prepIngredientName.lowercased().contains(query.lowercased())
            }
        }
    }
    
    private func generateAlphabet() {
        var letters = Set<String>()
        
        for prep in cachedPrepRecipes {
            if let firstChar = prep.prepIngredientName.first {
                let letter = String(firstChar).uppercased()
                letters.insert(letter)
            }
        }
        
        prepAlphabet = Array(letters).sorted()
    }
    
    private func organizePrepRecipes() {
        organizedPrepRecipes.removeAll()
        
        for letter in prepAlphabet {
            let letterPreps = cachedPrepRecipes.filter {
                let firstChar = $0.prepIngredientName.prefix(1).uppercased()
                return firstChar == letter
            }
            
            if !letterPreps.isEmpty {
                organizedPrepRecipes[letter] = letterPreps
            }
        }
    }
    
    func resetSearch() {
        searchText = ""
        filteredPrepRecipes = cachedPrepRecipes
    }
}
