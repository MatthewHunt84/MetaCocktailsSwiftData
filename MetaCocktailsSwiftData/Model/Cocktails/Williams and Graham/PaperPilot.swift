//
//  PaperPilot.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var paperPilot = Cocktail(cocktailName: "Paper Pilot",
                         imageAsset: nil,
                         glasswareType: .singleOld,
                         garnish: nil ,
                         ice: nil ,
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                         spec: paperPilotSpec,
                         tags: paperPilotTags,
                          collection: .williamsAndGraham)

let paperPilotSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.tarragon), value: 1, unit: .gentlyMuddled),
                                           CocktailIngredient(.juices(.lemon), value: 0.5),
                                           CocktailIngredient(.liqueurs(.giffardPassion), value: 0.75),
                                           CocktailIngredient(.amari(.aperol), value: 1),
                                           CocktailIngredient(.bitters(.peychauds), value: 0.5),
                                           CocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]
                                        

let paperPilotTags = Tags(profiles: [.herbal, .refreshing, .light, .fruity, .punchy],
                      styles: [.sour, .shaken])


