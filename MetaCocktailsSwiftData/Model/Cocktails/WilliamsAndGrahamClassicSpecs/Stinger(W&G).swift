//
//  Stinger(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var stingerWnG = Cocktail(cocktailName: "Stinger (W&G Version)",
                            glasswareType: .doubleOld,
                            garnish: [.mintSprigPowdered],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: stingerSpecWnG,
                            tags: stingerTagsWnG,
                          collection: .williamsAndGraham)

var stingerSpecWnG     =  [OldCocktailIngredient(.liqueurs(.cremeDeMenthe), value: 0.75),
                             OldCocktailIngredient(.brandies(.pF1840), value: 2.25)]

var stingerTagsWnG     = Tags(profiles: [.spiritForward, .punchy],
                                styles: [.oldFashioned, .shaken])
