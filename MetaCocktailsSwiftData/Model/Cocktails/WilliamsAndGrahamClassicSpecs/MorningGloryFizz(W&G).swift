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

var morningGloryFizzSpecWnG = [CocktailIngredient(.soda(.sodaWater), value: 2),
                               CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               CocktailIngredient(.syrups(.simple), value: 0.75),
                               CocktailIngredient(.juices(.lemon), value: 5),
                               CocktailIngredient(.juices(.lime), value: 3),
                               CocktailIngredient(.otherAlcohol(.absinthe), value: 4, unit: .dashes),
                               CocktailIngredient(.whiskies(.glenfiddich12), value: 2)]
