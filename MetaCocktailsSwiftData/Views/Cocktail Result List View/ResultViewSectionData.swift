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
    var cocktails: [Cocktail]
    
    init(count: Int, matched: Int, baseSpirit: String, cocktails: [Cocktail]) {
        self.count = count
        self.matched = matched
        self.baseSpirit = baseSpirit
        self.cocktails = cocktails
    }
    
    
}

