////
////  Penicillin.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/25/23.
////

import SwiftUI

var penicillin = Cocktail(cocktailName: "Penicillin",
                          glasswareType: Glassware.doubleOld,
                          garnish: [.candiedGinger],
                          ice: .bigRock,
                          author:Author(person: AuthorNames.samRoss.rawValue,
                                        place: AuthorPlaces.milkAndHoney.rawValue),
                          spec: penicillinSpec,
                          buildOrder: penicillinBuild,
                          tags: penicillinTags,
                          variation: .penicillin,
                          collection: .milkAndHoney,
                          titleCocktail: true)

var penicillinSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.75, unit: .fluidOunces),
                      OldCocktailIngredient(.syrups(.honeySyrup), value: 0.375, prep: PrepBible.honeySyrup),
                      OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.375, prep: PrepBible.gingerSyrup),
                      OldCocktailIngredient(.whiskies(.scotchBlended), value: 2),
                      OldCocktailIngredient(.whiskies(.scotchIsla), value: 0.25)]

var penicillinTags = Tags(flavors: [.lemon, .honey, .ginger, .peat],
                          profiles: [.citrusy, .smokey, .light, .complex],
                          styles: [.sour, .shaken])

var penicillinBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the Isla Scotch, together in a tin and shake with ice."), 
                                           Instruction(step: 2, method: "Strain over ice."),
                                           Instruction(step: 3, method: "Float the Islay whisky on top of the cocktail"),
                                           Instruction(step: 4, method: "Garnish With a piece of candied ginger.")])
