//
//  Brooklyn(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brooklynWnG = Cocktail(cocktailName: "Brooklyn Cocktail(W&G Version)",
                           glasswareType: .stemmedGlassware,
                           garnish: [.lemonExpression],
                           author: williamsAndGraham,
                           spec: brooklynWnGSpec,
                           tags: brooklynTags,
                           variation: .brooklyn,
                           collection: .williamsAndGraham)

var brooklynWnGSpec     =  [CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                            CocktailIngredient(.amari(.chinaChina), value: 0.25),
                            CocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            CocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

