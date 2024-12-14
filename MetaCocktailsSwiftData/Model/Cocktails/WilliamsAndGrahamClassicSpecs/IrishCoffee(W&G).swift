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

