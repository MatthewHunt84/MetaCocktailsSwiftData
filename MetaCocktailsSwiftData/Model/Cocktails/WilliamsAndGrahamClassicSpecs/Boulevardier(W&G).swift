//
//  Boulevardier(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var boulevardierWnG  =  Cocktail(cocktailName: "Boulevardier (Williams & Graham spec.)",
                              glasswareType: .martini,
                              garnish: [.orangePeel],
                              author:Author(person: "Erskine Gwynne",place: "Paris", year: "1920's"),
                              spec: boulevardierWnGSpec,
                              tags: boulevardierTags)

var boulevardierWnGSpec = [CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1.5),
                           CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                           CocktailIngredient(.amari(.campari), value: 0.75)]
