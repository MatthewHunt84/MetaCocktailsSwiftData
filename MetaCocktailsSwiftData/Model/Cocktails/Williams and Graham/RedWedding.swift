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
                                          place: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: redWeddingSpec,
                            buildOrder: nil,
                            tags: redWeddingTags)

var redWeddingSpec = [CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                      CocktailIngredient(.amari(.sfumato), value: 0.25),
                      CocktailIngredient(.amari(.cynar), value: 0.5),
                      CocktailIngredient(.amari(.aperol), value: 0.75),
                      CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]

var redWeddingTags = Tags(textures: [.rich],
                          styles: [.negroni, .stirred])
