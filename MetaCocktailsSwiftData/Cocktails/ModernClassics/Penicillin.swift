////
////  Penicillin.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/25/23.
////
//
//import SwiftUI
//
//var penicillin = Cocktail(cocktailName: "Penicillin",
//                          glasswareType: Glassware.doubleOld,
//                          garnish: [.candiedGinger],
//                          ice: .bigRock,
//                          author: "Sasha Petraske",
//                          spec: penicillinSpec,
//                          buildOrder: penicillinBuild,
//                          tags: penicillinTags)
//
//var penicillinSpec = [CocktailIngredient( .lemon, value: 0.75, unit: .fluidOunces),
//                                            CocktailIngredient( .honeySyrup, value: 0.375),
//                                            CocktailIngredient( .gingerSyrup, value: 0.375),
//                                            CocktailIngredient(.scotchBlended, value: 1.5),
//                                            CocktailIngredient( .scotchIsla, value: 0.25)]
//
//var penicillinBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the Isla Scotch, together in a tin and shake with ice."), 
//                                           Instruction(step: 2, method: "Strain over ice."),
//                                           Instruction(step: 3, method: "Float the Islay whisky on top of the cocktail"),
//                                           Instruction(step: 4, method: "Garnish With a piece of candied ginger.")])
//
//var penicillinTags = Tags(flavors: [.lemon, .honey, .ginger, .peat], 
//                          profiles: [.citrusy, .smokey],
//                          textures: [.light],
//                          styles: [.sour, .shaken],
//                          whiskies: [.scotchBlended, .scotchIsla])
