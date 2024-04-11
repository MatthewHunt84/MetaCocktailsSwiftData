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
    var cocktails: [CocktailsAndMissingIngredients]
    
    init(count: Int, matched: Int, cocktails: [CocktailsAndMissingIngredients]) {
        self.count = count
        self.matched = matched
        self.cocktails = cocktails
    }
}


struct CocktailsAndMissingIngredients {
    
    let id = UUID()
    var missingIngredients: [String]
    var cocktail: Cocktail

    
}
