//
//  Bramble(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brambleWng = Cocktail(cocktailName: "Bramble" + wAndGTitleTag,
                          glasswareType: .doubleOld,
                          garnish: [.lemonWheel],
                          ice: .pebbleIce,
                          author: williamsAndGraham,
                          spec: brambleWnGSpec,
                          buildOrder: brambleWGBuild,
                          tags: brambleTags,
                          variation: .bramble,
                          collection: .williamsAndGraham)

let brambleWnGSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                               OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                               OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5),
                                               OldCocktailIngredient(.gins(.fordsGin), value: 1.5)]



