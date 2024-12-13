//
//  QueensParkLight.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var queensParkLightMnH = Cocktail(cocktailName: "Queen's Park Swizzle (Light)",
                                  glasswareType: .doubleOld,
                                  garnish: [.mintBouquet],
                                  ice: .pebbleIce,
                                  author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                                 place: AuthorPlaces.milkAndHoney.rawValue,
                                                 year: "Early 2000s"),
                                  spec: queensParkLightMnHSpec,
                                  buildOrder: queensParkLightMnHBuild,
                                  tags: queensParkLightMnHTags,
                                  variation: .queensParkSwizzle,
                                  collection: .milkAndHoney,
                                  titleCocktail: false)

var queensParkLightMnHSpec = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                              OldCocktailIngredient(.juices(.lime), value: 1),
                              OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                              OldCocktailIngredient(.rums(.rumWhite), value: 2),
                              OldCocktailIngredient(.bitters(.peychauds), value: 5, unit: .dashes) ]

var queensParkLightMnHTags = Tags(flavors: [.lime, .mint, .bakingSpices],
                                  profiles: [.aromatic, .refreshing, .citrusy, .light],
                                  styles: [.swizzle, .sour])


