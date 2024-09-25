//
//  GinFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var ginFizzWnG  = Cocktail(cocktailName: "Gin Fizz" + wAndGTitleTag,
                           glasswareType: .fizzGlass,
                           garnish: [.noGarnish],
                           ice: nil,
                           author: williamsAndGraham,
                           spec: ginFizzSpecWnG,
                           buildOrder: ginFizzBuild,
                           tags: ginFizzTagsWnG,
                           variation: .ginFizz,
                           collection: .williamsAndGraham)

var ginFizzSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                       OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                       OldCocktailIngredient(.gins(.fordsGin), value: 2),
                       OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

var ginFizzTagsWnG   = Tags(flavors: [.lemon],
                         profiles: [.citrusy, .effervescent, .light, .refreshing],
                         styles: [.fizz, .shaken])
