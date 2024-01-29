//
//  Prep.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI


struct Prep: Identifiable, Hashable, Equatable {
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



let richDem = Prep(prepIngredientName: "Rich Demerara Syrup", prepRecipe:[Instruction(step: 1, method: "Weigh out two parts Demerara sugar to one part water and combine in a pot."),
                                                                          Instruction(step: 2, method: "Bring to a boil and then immediately take off heat."),
                                                                          Instruction(step: 3, method: "Let cool before bottling.")]   )

let cucumberSyrup = Prep(prepIngredientName: "Cucumber Syrup", prepRecipe:[Instruction(step: 1, method:  "Make a cucumber syrup")])

let gingerSyrup = Prep(prepIngredientName: "Ginger Syrup", prepRecipe:[Instruction(step: 1, method:  "Make a ginger syrup")] )

let orgeat = Prep(prepIngredientName: "Orgeat", prepRecipe: [Instruction(step: 1, method:  "Make orgeat, orNot.")])

let grapefruitShrub = Prep(prepIngredientName: "Grapefruit Shrub", prepRecipe: [Instruction(step: 1, method:  "For 500ml: Add 250ml white sugar to 150g grapefruit peels."),
                                                                                Instruction(step: 2, method: "Let sit in a mason jar for 24 hours in a semi-warm place."),
                                                                                Instruction(step: 3, method: " Add 250g fresh grapefruit juice and shake until the oleo emulsifies with the grapefruit juice."),
                                                                                Instruction(step: 4, method: "Strain the peels out. Keeps for 1 week in the fridge.")])

let peanutButterVodka = Prep(prepIngredientName: "Peanut Butter Vodka", prepRecipe:[Instruction(step: 1, method:"Add 150g of skippy creamy peanut butter into a deli and add a 750 ml. bottle of vodka."),
                                                                                    Instruction(step: 2, method: " Then just whisk in the peanut butter until it dissolves. Keeps forever, probably.")] )

let morgenthalersGingerSyrup = Prep(prepIngredientName: "Morgenthaler's Ginger Syrup", prepRecipe:[Instruction(step: 1, method:  "Roughly chop 8 ounces washed, unpeeled ginger (each piece about the size of your pinkie-tip). "),
                                                                                                   Instruction(step: 2, method: "Put in a blender and combine with equal parts sugar and boiling water."),
                                                                                                   Instruction(step: 3, method: " Blend on high until mixture is smooth, then fine-strain")])
