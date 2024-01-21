//
//  Prep.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


struct Prep: Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(prepIngredientName)
    }
    
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
    
    static let grapefruitShrub = Prep(id: 038, prepIngredientName: "Grapefruit Shrub", prepRecipe: "For 500ml: Add 250ml white sugar to 150g grapefruit peels. Let sit in a mason jar for 24 hours in a semi-warm place. Add 250g fresh grapefruit juice and shake until the oleo emulsifies with the grapefruit juice. Strain the peels out. Keeps for 1 week in the fridge.")
    
    static let peanutButterVodka = Prep(id: 039, prepIngredientName: "Peanut Butter Vodka", prepRecipe: "Add 150ml of skippy creamy peanut butter into a deli and add a 750 ml. bottle of vodka. Then just whisk in the PB until it dissolves. Keeps forever, probably.")
}
