//
//  HankyPanky(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var hankyPankyWnG = Cocktail(cocktailName: "Hanky Panky(W&G Version)",
                             glasswareType: .stemmedGlassware,
                             garnish: [.orangePeel],
                             author: williamsAndGraham,
                             spec: hankyPankySpecWnG,
                             tags: hankyPankyTags)

var hankyPankySpecWnG     =  [CocktailIngredient(.amari(.fernetBranca), value: 0.5),
                              CocktailIngredient(.gins(.fordsGin), value: 2),
                              CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75)]


