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
                                 author: Author(place: "Queens Park Hotel, Trinidad", year: "1920s"),
                                 spec: queensParkSpec,
                                 buildOrder: queensParkBuild,
                                 tags: queensParkTags,
                                 variation: .queensParkSwizzle,
                                 collection: .originals,
                                 titleCocktail: true)

var queensParkSpec = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                      OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.syrups(.richDem), value: 0.5, prep: PrepBible.richDem),
                      OldCocktailIngredient(.rums(.rumDemerara), value: 3),
                      OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes) ]

var queensParkTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                          profiles: [.aromatic, .refreshing, .citrusy, .light],
                          styles: [.swizzle, .sour])

var queensParkBuild = Build(instructions: [Instruction(step: 0, method: "The original recipe calls for the 'juice of half a lime and 15ml of a sugar syrup' Interpret that how you will."),
                                           Instruction(step: 1, method: "Add all ingredients to a tall glass and swizzle."),
                                           Instruction(step: 2, method: "Garnish with mint")])
