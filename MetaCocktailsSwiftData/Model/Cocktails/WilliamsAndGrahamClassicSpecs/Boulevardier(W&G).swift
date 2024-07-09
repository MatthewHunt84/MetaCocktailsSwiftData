//
//  Boulevardier(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var boulevardierWnG  =  Cocktail(cocktailName: "Boulevardier (W&G Version)",
                                 glasswareType: .martini,
                                 garnish: [.orangePeel],
                                 author: williamsAndGraham,
                                 spec: boulevardierWnGSpec,
                                 tags: boulevardierTags,
                                 variation: .boulevardier,
                                 collection: .williamsAndGraham)

var boulevardierWnGSpec = [OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1.5),
                           OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                           OldCocktailIngredient(.amari(.campari), value: 0.75)]
