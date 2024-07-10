//
//  MorningGloryFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var morningGloryFizzWnG = Cocktail(cocktailName: "Morning Glory Fizz (W&G Version)",
                                   glasswareType: .fizzGlass,
                                   garnish: [.lemonExpression],
                                   ice: nil,
                                   author: williamsAndGraham,
                                   spec: morningGloryFizzSpecWnG,
                                   buildOrder: morningGloryFizzBuild,
                                   tags: morningGloryFizzTags,
                                   variation: .morningGloryFizz,
                                   collection: .williamsAndGraham)

var morningGloryFizzSpecWnG = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                               OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               OldCocktailIngredient(.syrups(.simple), value: 0.75),
                               OldCocktailIngredient(.juices(.lemon), value: 5),
                               OldCocktailIngredient(.juices(.lime), value: 3),
                               OldCocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                               OldCocktailIngredient(.whiskies(.glenfiddich12), value: 2)]
