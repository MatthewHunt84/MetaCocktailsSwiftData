//
//  Prep.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


struct Prep: Identifiable, Hashable, Equatable, Codable {
    static func == (lhs: Prep, rhs: Prep) -> Bool {
        lhs.prepIngredientName == rhs.prepIngredientName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(prepIngredientName)
    }
    
    var id = UUID()
    var prepIngredientName: String
    var prepRecipe: [Instruction]
}


