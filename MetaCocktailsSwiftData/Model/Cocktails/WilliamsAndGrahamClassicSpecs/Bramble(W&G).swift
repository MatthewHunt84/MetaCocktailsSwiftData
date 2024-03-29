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
                          buildOrder: brambleWGBuild,
                          tags: brambleTags,
                          variation: .bramble,
                          collection: .williamsAndGraham)

let brambleWnGSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.75),
                                            CocktailIngredient(.syrups(.simple), value: 0.75),
                                            CocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5),
                                            CocktailIngredient(.gins(.fordsGin), value: 1.5)]

let brambleWGBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all ingredinents, except for the creme de cassis, in a tin with ice."),
                                           Instruction(step: 2, method: "Strain into a double old fashioned glass and add pebble ice."),
                                           Instruction(step: 3, method: "Then, drizzle the creme de mure over the top."),
                                           Instruction(step: 4, method: "Garnish with a lemon wheel."),
                                           Instruction(step: 5, method: "NOTE: This cocktail is significantly improved with fresh muddled bramble fruit(i.e. blackberries and raspberries). In this case, shake the cocktail, double strain the fruit and still leave the creme de mure to float.")])

