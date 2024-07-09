//
//  Martinez(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var martinezWnG = Cocktail(cocktailName: "Martinez (W&G Version)",
                           glasswareType: .stemmedGlassware,
                           garnish: [.maraschinoCherry],
                           author: williamsAndGraham,
                           spec: martinezSpecWnG,
                           tags: martinezTagsWnG,
                           variation: .martinez,
                           collection: .williamsAndGraham)

var martinezSpecWnG     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                            OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 1, unit: .barSpoon),
                            OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 1),
                            OldCocktailIngredient(.gins(.ransomOldTom), value: 2)]

var martinezTagsWnG    = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                              styles: [.martini, .stirred])

