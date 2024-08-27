//
//  SilverGinFiz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var silverGinFizz  = Cocktail(cocktailName: "Silver Gin Fizz",
                              glasswareType: .fizzGlass,
                              garnish: [.lemonPeel],
                              ice: nil,
                              author: jerryThomas,
                              spec: silverGinFizzSpec,
                              buildOrder: silverGinFizzBuild,
                              tags: silverGinFizzTags,
                              variation: .ginFizz,
                              collection: .originals)

var silverGinFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 1),
                          OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                          OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

var silverGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake"),
                                               Instruction(step: 2, method: "Then shake with ice."),
                                               Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda"),
                                               Instruction(step: 4, method: "Express the lemon peen then garnish with the peel.")])

var silverGinFizzTags   = Tags(flavors: [.lemon],
                               profiles: [.citrusy, .effervescent, .light, .silky, .refreshing],
                               styles: [.fizz, .shaken])

