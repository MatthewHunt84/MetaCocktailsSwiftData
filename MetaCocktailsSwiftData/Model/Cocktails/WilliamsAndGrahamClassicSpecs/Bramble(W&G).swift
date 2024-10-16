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

let brambleWGBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all ingredients, except for the creme de cassis, in a tin with ice."),
                                           Instruction(step: 2, method: "Strain into a double old fashioned glass and add pebble ice."),
                                           Instruction(step: 3, method: "Then, drizzle the creme de mure over the top."),
                                           Instruction(step: 4, method: "Garnish with a lemon wheel.")])

