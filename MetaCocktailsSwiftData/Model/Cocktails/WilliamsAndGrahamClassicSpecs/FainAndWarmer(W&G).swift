//
//  FainAndWarmer(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fairAndWarmerWnG = Cocktail(cocktailName: "Fair & Warmer(W&G Version)",
                                glasswareType: .coupe,
                                garnish: [.orangePeel],
                                author: williamsAndGraham,
                                spec: fairAndWarmerWnGSpec,
                                tags: fairAndWarmerTags)

var fairAndWarmerWnGSpec     =  [CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                                 CocktailIngredient(.fortifiedWines(.dolinRouge), value: 0.5),
                                 CocktailIngredient(.rums(.plantation3Star), value: 1.5)]

