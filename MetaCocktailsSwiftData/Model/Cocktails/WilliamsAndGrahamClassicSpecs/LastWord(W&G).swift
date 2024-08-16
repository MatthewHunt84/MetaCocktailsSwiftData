//
//  LastWord(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var lastWordWnG = Cocktail(cocktailName: "Last Word (W&G Version)",
                           glasswareType: .stemmedGlassware,
                           ice: nil,
                           author: williamsAndGraham,
                           spec: lastWordSpecWnG,
                           buildOrder: nil,
                           tags: lastWordTags,
                           variation: .lastWord,
                           collection: .williamsAndGraham)

var lastWordSpecWnG  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                        OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75),
                        OldCocktailIngredient(.gins(.fordsGin), value: 1)]

