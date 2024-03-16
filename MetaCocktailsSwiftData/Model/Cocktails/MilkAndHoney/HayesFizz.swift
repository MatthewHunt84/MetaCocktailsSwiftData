//
//  HayesFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var hayesFizz  = Cocktail(cocktailName: "Hayes Fizz",
                          glasswareType: .collins,
                          garnish: [.maraschinoCherry, .halfOrangeWheel],
                          ice: .columnIce,
                          author: sashaPetraske,
                          spec: hayesFizzSpec,
                          buildOrder: hayesFizzBuild,
                          tags: hayesFizzTags,
                          variation: .ginFizz,
                          collection: .milkAndHoney)

var hayesFizzSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.otherAlcohol(.absinthe), value: 1, unit: .glassRinse),
                      CocktailIngredient(.syrups(.simple), value: 0.75),
                      CocktailIngredient(.gins(.ginAny), value: 2),
                      CocktailIngredient(.soda(.sodaWater) , value: 2)]

var hayesFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the lemon juice, simple syrup, and gin in a cocktail shaker, add 1 large ice cube, and shake vigorously until the drink is sufficiently chilled."),
                                           Instruction(step: 2, method: "Put a large Collins ice cube in a chilled Collins glass and rinse with absinthe."),
                                           Instruction(step: 3, method: "Strain the cocktail into the glass and garnish with the orange slice and cherry.")])

var hayesFizzTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                           styles: [.collins, .shaken])

