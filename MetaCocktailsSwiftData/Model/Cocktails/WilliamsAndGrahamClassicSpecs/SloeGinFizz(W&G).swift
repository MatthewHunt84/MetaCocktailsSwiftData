//
//  SloeGinFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sloeGinFizzWnG  = Cocktail(cocktailName: "Sloe Gin Fizz" + wAndGTitleTag,
                               glasswareType: .fizzGlass,
                               garnish: [.lemonPeel],
                               ice: nil,
                               author: nil,
                               spec: sloeGinFizzSpecWnG,
                               buildOrder: sloeGinFizzBuildWnG,
                               tags: sloeGinFizzTagsWnG,
                               variation: .sloeGinFizz,
                               collection: .williamsAndGraham)

var sloeGinFizzSpecWnG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                           OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                           OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                           OldCocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1.5),
                           OldCocktailIngredient(.soda(.sparklingWater), value: 2)]



var sloeGinFizzTagsWnG   = Tags(profiles: [.citrusy, .effervescent, .light, .silky, .refreshing, .fruity],
                                styles: [.fizz, .shaken])

