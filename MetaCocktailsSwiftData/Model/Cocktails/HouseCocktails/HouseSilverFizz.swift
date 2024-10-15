//
//  HouseSilverFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation
var houseSilverGinFizz  = Cocktail(cocktailName: "Silver Gin Fizz" + houseTag,
                                   glasswareType: .fizzGlass,
                                   garnish: [.lemonPeel],
                                   spec: houseSilverGinFizzSpec,
                                   buildOrder: houseSilverGinFizzBuild,
                                   tags: houseSilverGinFizzTags,
                                   variation: .silverFizz,
                                   collection: .house)

var houseSilverGinFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                               OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                               OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                               OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

var houseSilverGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake"),
                                                    Instruction(step: 2, method: "Then shake with ice."),
                                                    Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda"),
                                                    Instruction(step: 4, method: "Express the lemon peen then garnish with the peel.")])

var houseSilverGinFizzTags   = Tags(flavors: [.lemon],
                                    profiles: [.citrusy, .effervescent, .light, .silky, .refreshing],
                                    styles: [.fizz, .shaken])
