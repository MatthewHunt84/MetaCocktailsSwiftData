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

