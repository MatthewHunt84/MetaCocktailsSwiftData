//
//  LastWord(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var lastWordWnG = Cocktail(cocktailName: "Last Word(W&G Version)",
                           glasswareType: .stemmedGlassware,
                           ice: nil,
                           author: williamsAndGraham,
                           spec: lastWordSpecWnG,
                           buildOrder: nil,
                           tags: lastWordTags,
                           variation: .lastWord,
                           collection: .williamsAndGraham)

var lastWordSpecWnG  = [CocktailIngredient(.juices(.lime), value: 0.75),
                        CocktailIngredient(.syrups(.simple), value: 0.25),
                        CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                        CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75),
                        CocktailIngredient(.gins(.fordsGin), value: 1)]

