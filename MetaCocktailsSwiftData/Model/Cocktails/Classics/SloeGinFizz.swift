//
//  SloeGinFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sloeGinFizz  = Cocktail(cocktailName: "Sloe Gin Fizz",
                            glasswareType: .fizzGlass,
                            garnish: [.lemonPeel],
                            ice: nil,
                            author: nil,
                            spec: sloeGinFizzSpec,
                            buildOrder: sloeGinFizzBuild,
                            tags: sloeGinFizzTags,
                            variation: .sloeGinFizz,
                            titleCocktail: true)

var sloeGinFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.liqueurs(.plymouthSloeGin), value: 1.5),
                        OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

var sloeGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Note: This is another cocktail that fails to produce a legitimate author."),
                                             Instruction(step: 2, method: "Add all ingredients, except for the sparkling water,and shake with ice."),
                                             Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda"),
                                             Instruction(step: 4, method: "Garnish with a lemon peel after expression.")])

var sloeGinFizzTags   = Tags(flavors: [.lemon],
                             profiles: [.citrusy, .effervescent, .light, .silky, .refreshing, .fruity],
                             styles: [.fizz, .shaken])

