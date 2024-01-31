//
//  Boulevardier(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var boulevardierWnG  =  Cocktail(cocktailName: "Boulevardier(W&G Version)",
                                 glasswareType: .martini,
                                 garnish: [.orangePeel],
                                 author: williamsAndGraham,
                                 spec: boulevardierWnGSpec,
                                 tags: boulevardierTags)

var boulevardierWnGSpec = [CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1.5),
                           CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                           CocktailIngredient(.amari(.campari), value: 0.75)]
