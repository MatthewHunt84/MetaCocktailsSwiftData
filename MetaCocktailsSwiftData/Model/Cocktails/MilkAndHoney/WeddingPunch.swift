//
//  WeddingPunch.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var weddingPunch = Cocktail(cocktailName: "Wedding Punch",
                            glasswareType: .punchBowl,
                            garnish: [.wholeOrangeSliced, .wholeLimesSliced, .wholeLemonsSliced, .assortedBerries230g],
                            ice: .oneLargeBlock,
                            author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                           place: AuthorPlaces.milkAndHoney.rawValue,
                                           year: "Early 2000s"),
                            spec: weddingPunchSpec,
                            buildOrder: weddingPunchBuild,
                            tags: weddingPunchTags,
                            variation: nil,
                            collection: .milkAndHoney,
                            titleCocktail: false)

var weddingPunchSpec = [OldCocktailIngredient(.wines(.prosecco), value: 8, unit: .bottles),
                        OldCocktailIngredient(.fortifiedWines(.martiniBianco), value: 4, unit: .bottles),
                        OldCocktailIngredient(.liqueurs(.giffardElderflour), value: 1, unit: .bottles) ]

var weddingPunchTags = Tags(profiles: [.aromatic, .refreshing, .citrusy, .effervescent],
                            styles: [.built])

var weddingPunchBuild = Build(instructions: [Instruction(step: 1, method: "Combine the 750ml bottles of liqueur, 750ml bottles of vermouth, and 750ml bottles of prosecco in a punch bowl large enough to hold an 8-inch (20 cm) square block of ice."),
                                             Instruction(step: 2, method: "Add the ice and garnish with the berries and citrus wheels."),
                                             Instruction(step: 3, method: "Makes 10.75 liters.")])
