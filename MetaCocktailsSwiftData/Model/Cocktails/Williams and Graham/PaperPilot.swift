//
//  PaperPilot.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var paperPilot = Cocktail(cocktailName: "Paper Pilot",
                          glasswareType: .singleOld,
                          author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                        place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                          spec: paperPilotSpec,
                          tags: paperPilotTags,
                          collection: .williamsAndGraham)

let paperPilotSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.tarragon), value: 1, unit: .gentlyMuddled),
                                               OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                               OldCocktailIngredient(.liqueurs(.giffardPassion), value: 0.75),
                                               OldCocktailIngredient(.amari(.aperol), value: 1),
                                               OldCocktailIngredient(.bitters(.peychauds), value: 0.5),
                                               OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]


let paperPilotTags = Tags(profiles: [.herbal, .refreshing, .light, .fruity, .punchy],
                          styles: [.sour, .shaken])


