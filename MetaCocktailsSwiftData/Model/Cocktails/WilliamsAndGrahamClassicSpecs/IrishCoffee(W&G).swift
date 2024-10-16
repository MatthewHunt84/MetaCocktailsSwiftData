//
//  IrishCoffee(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var irishCoffeeWnG = Cocktail(cocktailName: "Irish Coffee" + wAndGTitleTag,
                              glasswareType: .toddyGlass,
                              garnish: nil,
                              author: williamsAndGraham,
                              spec: irishCoffeeWnGSpec,
                              buildOrder: irishCoffeeWnGBuild,
                              tags: irishCoffeeWnGTags,
                              variation: .irishCoffee,
                              collection: .williamsAndGraham)

var irishCoffeeWnGSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1),
                           OldCocktailIngredient(.otherNonAlc(.coffee), value: 3),
                           OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5, prep: PrepBible.demSyrupPrep),
                           OldCocktailIngredient(.whiskies(.bushmills12), value: 2)]

var irishCoffeeWnGTags = Tags(flavors: [.coffee],
                              profiles: [.hot, .punchy],
                              styles: [.toddy])

var irishCoffeeWnGBuild = Build(instructions: [Instruction(step: 1, method: "Pre whip the cream so that it doubles in volume"),
                                               Instruction(step: 2, method: "Heat up the coffee and dem a small shaker tin. "),
                                               Instruction(step: 3, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                               Instruction(step: 4, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                               Instruction(step: 5, method: "After your ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail. "),
                                               Instruction(step: 6, method: "Then add fresh hot coffee and top with stiff cream.")])
