//
//  HighlandLass.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var highlandLass = Cocktail(cocktailName: "Highland Lass",
                            glasswareType: .doubleOld,
                            garnish: [.lemonPeel, .mintSprig],
                            ice: .bigRock,
                            author: Author(person: "Kenny Remster", place: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: highlandLassSpec,
                            tags: highlandLassTags,
                            collection: .williamsAndGraham)

let highlandLassSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                              OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                              OldCocktailIngredient(.syrups(.honeySyrup), value: 0.25, prep: PrepBible.honeySyrup),
                                              OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                                              OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBible.cucumberSyrup),
                                              OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.5),
                                              OldCocktailIngredient(.whiskies(.compassBoxOakCross), value: 1.5)]


let highlandLassTags = Tags(profiles: [.refreshing, .complex, .fruity, .herbal],
                            styles: [.sour, .shaken, .tiki])

