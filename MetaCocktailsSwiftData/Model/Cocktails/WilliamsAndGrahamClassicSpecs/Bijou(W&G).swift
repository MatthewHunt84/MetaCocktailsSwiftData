//
//  Bijou(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bijouWnG = Cocktail(cocktailName: "Bijou(W&G Version)",
                        glasswareType: .stemmedGlassware,
                        garnish: [.orangePeel],
                        author: williamsAndGraham,
                        spec: bijouWnGSpec,
                        tags: bijouTags)

var bijouWnGSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                         CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                         CocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                         CocktailIngredient(.gins(.fordsGin), value: 1)]
