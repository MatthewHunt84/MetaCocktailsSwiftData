//
//  GinFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI

var ginFizz  = Cocktail(name: "Gin Fizz",
                         imageName: "empty-Cocktail",
                         glasswareType: .smallHighball,
                         garnish: [GarnishCatalog.lemonPeel.asset],
                         ice: nil,
                         author: "Jerry Thomas",
                         spec: ginFizzSpec,
                         buildOrder: ginFizzBuild,
                         tags: ginFizzTags)

var ginFizzSpec  = [CocktailIngredient(name: .lemon, value: 0.75, unit: .fluidOunces), 
                    CocktailIngredient(name: .simple, value: 0.75, unit: .fluidOunces),
                    CocktailIngredient(name: .gin, value: 1.5, unit: .fluidOunces),
                    CocktailIngredient(name:.sparklingWater , value: 2, unit: .fluidOunces)]

var ginFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and shake with ice"), 
                                         Instruction(step: 2, method: "strain into a small chilled highball glass and top with sparkling water"),
                                         Instruction(step: 3, method: "Give a gentle stir"),
                                         Instruction(step: 4, method: "make it a silver fizz by adding eggwhites and a dry shake before shaking with ice. This is the preferred method for most. In this case, add a lemon expression to the final product.")])

var ginFizzTags   = Tags(flavors: [.lemon],
                         profiles: [.fruity, .citrusy],
                         textures: [.effervescent, .light],
                         styles: [.fizz, .shaken],
                         baseComponents: [.gin])
