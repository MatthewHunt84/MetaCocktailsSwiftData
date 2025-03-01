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

var redWeddingSpec = [OldCocktailIngredient(.seasoning(.saline), value: 5, unit: .drops, prep: PrepBible.fiveToOneSaline),
                      OldCocktailIngredient(.amari(.sfumato), value: 0.5),
                      OldCocktailIngredient(.amari(.cynar), value: 0.5),
                      OldCocktailIngredient(.amari(.aperol), value: 0.75),
                      OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1)]

var redWeddingTags = Tags(flavors: [.orange],
                          profiles: [.rich, .bittersweet, .punchy, .bitter],
                          styles: [.negroni, .stirred])
