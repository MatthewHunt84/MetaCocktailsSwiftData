//
//  Stinger(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var stingerWnG = Cocktail(cocktailName: "Rusty Nail(W&G Version)",
                            glasswareType: .doubleOld,
                            garnish: [.mintSprigPowdered],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: stingerSpecWnG,
                            tags: stingerTagsWnG)

var stingerSpecWnG     =  [CocktailIngredient(.liqueurs(.cremeDeMenthe), value: 0.75),
                             CocktailIngredient(.brandies(.pF1840), value: 2.25)]

var stingerTagsWnG     = Tags(profiles: [.spiritForward, .punchy],
                                styles: [.oldFashioned, .shaken])
