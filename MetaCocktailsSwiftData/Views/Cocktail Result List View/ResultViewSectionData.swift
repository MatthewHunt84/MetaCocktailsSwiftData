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
    var cocktails: [Cocktail]
    
    init(count: Int, matched: Int, cocktails: [Cocktail]) {
        self.count = count
        self.matched = matched
        self.cocktails = cocktails
    }
}
