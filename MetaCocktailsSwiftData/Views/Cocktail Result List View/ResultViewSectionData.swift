//
//  ResultViewSectionData.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/4/24.
//

import SwiftUI

class ResultViewSectionData {
    
    let id = UUID()
    var sectionsPreferredCount: Int
    var matched: Int
    var cocktails: [CocktailsAndMissingIngredients]
    
    init(count: Int, matched: Int, cocktails: [CocktailsAndMissingIngredients]) {
        self.sectionsPreferredCount = count
        self.matched = matched
        self.cocktails = cocktails
    }
}


struct CocktailsAndMissingIngredients: Equatable {
    
    let id = UUID()
    var missingIngredients: [String]
    var cocktail: Cocktail

    
}
