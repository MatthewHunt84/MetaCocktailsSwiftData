//
//  RedWedding.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var redWedding  =  Cocktail(cocktailName: "Red Wedding",
                            glasswareType: Glassware.doubleOld,
                            garnish: [.orangePeel],
                            ice: .bigRock,
                            author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                          place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                            spec: redWeddingSpec,
                            buildOrder: nil,
                            tags: redWeddingTags,
                            collection: .williamsAndGraham)

var redWeddingSpec = [OldCocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                      OldCocktailIngredient(.amari(.sfumato), value: 0.25),
                      OldCocktailIngredient(.amari(.cynar), value: 0.5),
                      OldCocktailIngredient(.amari(.aperol), value: 0.75),
                      OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]

var redWeddingTags = Tags(flavors: [.orange],
                          profiles: [.rich, .bittersweet, .punchy],
                          styles: [.negroni, .stirred])
