//
//  HankyPanky(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var hankyPankyWnG = Cocktail(cocktailName: "Hanky Panky" + wAndGTitleTag,
                             glasswareType: .stemmedGlassware,
                             garnish: [.orangePeel],
                             author: williamsAndGraham,
                             spec: hankyPankySpecWnG,
                             tags: hankyPankyTags,
                             variation: .hankyPanky,
                             collection: .williamsAndGraham)

var hankyPankySpecWnG     =  [OldCocktailIngredient(.amari(.fernetBranca), value: 0.5),
                              OldCocktailIngredient(.gins(.fordsGin), value: 2),
                              OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75)]


