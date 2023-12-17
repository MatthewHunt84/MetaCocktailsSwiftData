//
//  Prep.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


struct Prep: Identifiable {
    
    var id: Int
    var prepIngredientName: String
    var prepRecipe: String
}

struct PrepItemRecipe: Identifiable {
    var id = UUID()
    
    static let richDem = Prep(id: 034, prepIngredientName: "Rich Demerara Syrup", prepRecipe: "Make a rich syrup")
    
    static let cucumberSyrup = Prep(id: 035, prepIngredientName: "Cucumber Syrup", prepRecipe: "Make a cucumber syrup")
    
    static let gingerSyrup = Prep(id: 036, prepIngredientName: "Ginger Syrup", prepRecipe: PrepRecipeDescriptions.gingerSyrupRecipe)
    
    static let orgeat = Prep(id: 037, prepIngredientName: "Orgeat", prepRecipe: "Make orgeat, orNot.")
}
