//
//  TemperanceIrishCoffee.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var temperanceIrishCoffee = Cocktail(cocktailName: "Temperance Irish Coffee",
                                     glasswareType: .toddyGlass,
                                     garnish: [.nutmeg, .cinnamon],
                                     author: sashaPetraske,
                                     spec: temperanceIrishCoffeeSpec,
                                     buildOrder: temperanceIrishBuild,
                                     tags: temperanceIrishCoffeeTags,
                                     variation: .irishCoffee,
                                     collection: .milkAndHoney,
                                     titleCocktail: false)

var temperanceIrishCoffeeSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1.5),
                                  OldCocktailIngredient(.otherNonAlc(.espressoShot), value: 2, unit: .none),
                                  OldCocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 2, unit: .none),
                                  OldCocktailIngredient(.otherNonAlc(.hotWater), value: 4)]

var temperanceIrishCoffeeTags = Tags(flavors: [.coffee],
                                     profiles: [.hot],
                                     styles: [.toddy, .nonAlcoholic])

var temperanceIrishBuild = Build(instructions: [Instruction(step: 1, method: "Heat up your mug with hot water."),
                                                Instruction(step: 2, method: "Dump the water then add all the ingredients, leaving the cream to float on top.")])
