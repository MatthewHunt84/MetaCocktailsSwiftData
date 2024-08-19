//
//  Daiquiri4OG.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/18/24.
//

import Foundation

let daiquiriNo4OG = Cocktail(cocktailName: "Daiquiri No. 4",
                             glasswareType: .coupe,
                             garnish: [.maraschinoCherry],
                             author: Author(person: AuthorNames.constante.rawValue,
                                            place: "Bar La Florida Cocktails, 1st Edition",
                                            year: "1934"),
                             spec: daiquiriNo4OGSpec,
                             tags: daiquiriNo4OGTags,
                             variation: .daiquiri,
                             collection: .originals)

var daiquiriNo4OGSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.bacardi), value: 2.0),
                                                  OldCocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .teaspoon),
                                                  OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .teaspoon),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.75)]

var daiquiriNo4OGTags = Tags(profiles: [.citrusy, .refreshing, .tart, .fruity],
                             styles: [.sour, .blended])

