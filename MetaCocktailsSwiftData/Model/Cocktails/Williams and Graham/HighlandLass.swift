//
//  HighlandLass.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var highlandLass = Cocktail(cocktailName: "Highland Lass",
                            imageAsset: nil,
                            glasswareType: .doubleOld,
                            garnish: [.dehydratedGrapefruitSlice],
                            ice: .bigRock,
                            author: Author(person: "Kenny Remster", place: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: highlandLassSpec,
                            tags: highlandLassTags)

let highlandLassSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                              CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                              CocktailIngredient(.juices(.lemon), value: 0.75),
                                              CocktailIngredient(.syrups(.honeySyrup), value: 0.25),
                                              CocktailIngredient(.syrups(.gingerSyrup), value: 0.25),
                                              CocktailIngredient(.syrups(.cucumberSyrup), value: 0.5),
                                              CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.5),
                                              CocktailIngredient(.whiskies(.compassBoxOakCross), value: 1.5)]


let highlandLassTags = Tags(profiles: [.refreshing, .complex, .fruity, .herbal],
                            styles: [.sour, .shaken, .tiki])

