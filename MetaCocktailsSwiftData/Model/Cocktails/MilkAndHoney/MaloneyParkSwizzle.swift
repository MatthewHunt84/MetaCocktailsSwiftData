//
//  MaloneyParkSwizzle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var maloneyParkSwizzle = Cocktail(cocktailName: "Maloney Park Swizzle",
                                 glasswareType: .collins,
                                 garnish: [.mintBouquet],
                                 ice: .pebbleIce,
                                  author: Author(person: AuthorNames.tobyMaloney.rawValue,
                                                 place: AuthorPlaces.milkAndHoney.rawValue,
                                                 year: "Early 2000s"),
                                 spec: maloneyParkSpec,
                                 buildOrder: maloneyParkBuild,
                                 tags: maloneyParkTags,
                                 variation: .queensParkSwizzle,
                                 collection: .milkAndHoney,
                                 titleCocktail: false)

var maloneyParkSpec = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                      OldCocktailIngredient(.juices(.lime), value: 0.75),
                      OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.rums(.ronMutusalemRumClassico), value: 2),
                      OldCocktailIngredient(.bitters(.peychauds), value: 5, unit: .dashes) ]

var maloneyParkTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                          profiles: [.aromatic, .refreshing, .citrusy, .light],
                          styles: [.swizzle, .sour])


