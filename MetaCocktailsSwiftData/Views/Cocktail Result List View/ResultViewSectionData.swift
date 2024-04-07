//
//  ResultViewSectionData.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.
//

import SwiftUI

class ResultViewSectionData {
    let id = UUID()
    let count: Int
    let matched: Int
    var baseSpirit: String
    var cocktails: [CocktailsAndTheirMissingIngredients]
    var filterPreference: String
    //var missingIngredientCocktails: [MissingIngredientSectionData]
    
    init(count: Int, matched: Int, baseSpirit: String, cocktails: [CocktailsAndTheirMissingIngredients], filterPreference: String) {
        self.count = count
        self.matched = matched
        self.baseSpirit = baseSpirit
        self.cocktails = cocktails
        self.filterPreference = filterPreference
    }
}

class CocktailsAndTheirMissingIngredients: Equatable, Hashable {
    static func == (lhs: CocktailsAndTheirMissingIngredients, rhs: CocktailsAndTheirMissingIngredients) -> Bool {
        return lhs.missingIngredients == rhs.missingIngredients
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(missingIngredients)
    }
    
    let id = UUID()
    var missingIngredients: [String]
    var cocktail: Cocktail
    
    init(missingIngredients: [String], cocktail: Cocktail) {
        self.missingIngredients = missingIngredients
        self.cocktail = cocktail
    }
    
}
