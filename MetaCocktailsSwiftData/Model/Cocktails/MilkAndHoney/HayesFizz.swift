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
                          variation: nil,
                          collection: .milkAndHoney)

var hayesFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                      OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                      OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.gins(.ginAny), value: 2),
                      OldCocktailIngredient(.soda(.sodaWater) , value: 2)]

var hayesFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the lemon juice, simple syrup, and gin in a cocktail shaker."),
                                           Instruction(step: 2, method: "Add one large ice cube and shake vigorously until the drink is sufficiently chilled."),
                                           Instruction(step: 3, method: "Put a large collins-length ice cube in a chilled collins glass and rinse with absinthe."),
                                           Instruction(step: 4, method: "Strain the cocktail into the glass and garnish with the orange slice and cherry.")])

var hayesFizzTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                           styles: [.collins, .shaken])

