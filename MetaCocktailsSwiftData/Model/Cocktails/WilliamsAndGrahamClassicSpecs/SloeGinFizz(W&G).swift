//
//  SloeGinFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sloeGinFizzWnG  = Cocktail(cocktailName: "Sloe Gin Fizz (W&G Version)",
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

var sloeGinFizzBuildWnG  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake"),
                                                Instruction(step: 2, method: "Then shake with ice."),
                                                Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda"),
                                                Instruction(step: 4, method: "Express the lemon peen then garnish with the peel.")])

var sloeGinFizzTagsWnG   = Tags(profiles: [.citrusy, .effervescent, .light, .silky, .refreshing, .fruity],
                                styles: [.fizz, .shaken])

