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


