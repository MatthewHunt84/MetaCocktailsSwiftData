//
//  French75.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI

var french75  = Cocktail(cocktailName: "French 75",
                         glasswareType: .collins,
                         garnish: [.lemonPeel],
                         ice: .crackedIce,
                         author: nil,
                         spec: french75Spec,
                         buildOrder: french75Build,
                         tags: french75Tags)

var french75Spec  = [CocktailIngredient( .lemon, value: 0.75, unit: .fluidOunces),
                     CocktailIngredient( .simple, value: 0.75, unit: .fluidOunces),
                     CocktailIngredient( .gin, value: 1.5, unit: .fluidOunces),
                     CocktailIngredient(.champagne , value: 4, unit: .fluidOunces)]

var french75Build  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"), 
                                          Instruction(step: 2, method: "strain over cracked ice and top with Champagne"),
                                          Instruction(step: 3, method: "Give a gentle stir")])

var french75Tags   = Tags(flavors: [.lemon], 
                          profiles: [.citrusy, .floral],
                          textures: [.effervescent, .light],
                          styles: [.collins, .shaken, .built],
                          bases: [.gin])
