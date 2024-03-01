//
//  GinFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var ginFizzWnG  = Cocktail(cocktailName: "Gin Fizz(W&G Version)",
                           glasswareType: .fizzGlass,
                           garnish: [.noGarnish],
                           ice: nil,
                           author: williamsAndGraham,
                           spec: ginFizzSpecWnG,
                           buildOrder: ginFizzBuild,
                           tags: ginFizzTags,
                           variation: .ginFizz,
                           collection: .williamsAndGraham)

var ginFizzSpecWnG  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                       CocktailIngredient(.syrups(.simple), value: 0.75),
                       CocktailIngredient(.gins(.fordsGin), value: 2),
                       CocktailIngredient(.soda(.sparklingWater), value: 2)]

