//
//  Bramble(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brambleWng = Cocktail(cocktailName: "Bramble(W&G Version)",
                          imageAsset: nil,
                          glasswareType: .doubleOld,
                          garnish: [.lemonWheel],
                          ice: .pebbleIce,
                          author: williamsAndGraham,
                          spec: brambleWnGSpec,
                          tags: brambleTags,
                          variation: .bramble)

let brambleWnGSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.75),
                                            CocktailIngredient(.syrups(.simple), value: 0.75),
                                            CocktailIngredient(.liqueurs(.cremeDeCassis), value: 1, unit: .float),
                                            CocktailIngredient(.gins(.fordsGin), value: 1.5)]
