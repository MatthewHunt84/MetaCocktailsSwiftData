//
//  Martinez(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var martinezWnG = Cocktail(cocktailName: "Martinez(W&G Version)",
                           glasswareType: .stemmedGlassware,
                           garnish: [.maraschinoCherry],
                           author: williamsAndGraham,
                           spec: martinezSpecWnG,
                           tags: martinezTagsWnG,
                           variation: .martinez)

var martinezSpecWnG     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                            CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .barSpoon),
                            CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 1),
                            CocktailIngredient(.gins(.ransomOldTom), value: 2)]

var martinezTagsWnG    = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                              styles: [.martini, .stirred])

