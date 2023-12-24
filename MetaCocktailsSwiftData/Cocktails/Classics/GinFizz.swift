////
////  GinFizz.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////
//
//import SwiftUI
//
//var ginFizz  = Cocktail(cocktailName: "Gin Fizz",
//                         glasswareType: .smallHighball,
//                         garnish: [.lemonPeel],
//                         ice: nil,
//                         author: "Jerry Thomas",
//                         spec: ginFizzSpec,
//                         buildOrder: ginFizzBuild,
//                         tags: ginFizzTags)
//
//var ginFizzSpec  = [CocktailIngredient( .lemon, value: 0.75),
//                    CocktailIngredient( .simple, value: 0.75),
//                    CocktailIngredient( .gin, value: 1.5),
//                    CocktailIngredient(.sparklingWater , value: 2)]
//
//var ginFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and shake with ice"), 
//                                         Instruction(step: 2, method: "strain into a small chilled highball glass and top with sparkling water"),
//                                         Instruction(step: 3, method: "Give a gentle stir"),
//                                         Instruction(step: 4, method: "make it a silver fizz by adding eggwhites and a dry shake before shaking with ice. This is the preferred method for most. In this case, add a lemon expression to the final product.")])
//
//var ginFizzTags   = Tags(flavors: [.lemon],
//                         profiles: [.citrusy],
//                         textures: [.effervescent, .light],
//                         styles: [.fizz, .shaken],
//                         gin: [.gin])
//                      
