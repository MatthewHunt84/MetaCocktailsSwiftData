//
//  Sazerac(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sazeracWnG = Cocktail(cocktailName: "Sazerac" + wAndGTitleTag,
                          glasswareType: .singleOld,
                          garnish: [.lemonPeel],
                          ice: nil,
                          author: williamsAndGraham,
                          spec: sazeracSpecWnG,
                          buildOrder: sazeracBuildWnG,
                          tags: sazeracTagsWnG,
                          variation: .sazerac,
                          collection: .williamsAndGraham)

var sazeracSpecWnG  = [OldCocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 1, unit: .whole),
                       OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 2),
                       OldCocktailIngredient(.bitters(.peychauds), value: 7, unit: .dashes),
                       OldCocktailIngredient(.otherAlcohol(.absinthe), value: 7, unit: .sprays),]

var sazeracTagsWnG = Tags(flavors: [.lemon],
                          profiles: [.spiritForward, .punchy],
                          styles: [.oldFashioned, .stirred])

var sazeracBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle your sugar cube and bitters together in a mixing glass with a splash of soda water to help the sugar disolve."),
                                           Instruction(step: 2, method: "Add the whiskey and ice and stir."),
                                           Instruction(step: 3, method: "Add your cocktail to the frozen absinthe rinsed glass"),
                                           Instruction(step: 4, method: "Garnish with a lemon twist."),
                                           Instruction(step: 5, method: "The original was done with Cognac. Try it! It doesn't suck.")])

