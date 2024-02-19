////
////  QueensParkSwizzle.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/5/23.
////

import SwiftUI



var queensParkSwizzle = Cocktail(cocktailName: "Queens Park Swizzle",
                                 glasswareType: .collins,
                                 garnish: [.mintBouquet],
                                 ice: .pebbleIce,
                                 author: Author(place: "Queens Park Hotel, Trinidad", year: "1920's"),
                                 spec: queensParkSpec,
                                 buildOrder: queensParkBuild,
                                 tags: queensParkTags,
                                 variation: .queensParkSwizzle)

var queensParkSpec = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                      CocktailIngredient(.juices(.lime), value: 0.75),
                      CocktailIngredient(.syrups(.richDem), value: 0.5),
                      CocktailIngredient(.rums(.rumDemerara), value: 3),
                      CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes) ]

var queensParkTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                          profiles: [.aromatic, .refreshing, .citrusy, .light],
                          styles: [.swizzle, .sour])

var queensParkBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to a tall glass and swizzle."),
                                           Instruction(step: 2, method: "Garnish with mint"),
                                           Instruction(step: 3, method: "NOTE: The original recipe says 'juice of half a lime and 15ml of a sugar syrup.' Interpret that how you must.")])
