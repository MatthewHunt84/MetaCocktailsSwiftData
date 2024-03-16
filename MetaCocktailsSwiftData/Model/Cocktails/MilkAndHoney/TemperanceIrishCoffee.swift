//
//  TemperanceIrishCoffee.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var temperanceIrishCoffee = Cocktail(cocktailName: "Temperance Irish Coffee",
                                     glasswareType: .toddyGlass,
                                     garnish: nil,
                                     author: sashaPetraske,
                                     spec: temperanceIrishCoffeeSpec,
                                     buildOrder: nil,
                                     tags: temperanceIrishCoffeeTags,
                                     variation: .irishCoffee,
                                     collection: .milkAndHoney,
                                     titleCocktail: false)

var temperanceIrishCoffeeSpec  = [CocktailIngredient(.otherNonAlc(.stiffCream), value: 1.5, unit: .fluidOuncesFloated),
                                  CocktailIngredient(.otherNonAlc(.espressoShot), value: 2, unit: .whole),
                                  CocktailIngredient(.otherNonAlc(.demeraraSugarCube), value: 2, unit: .whole),
                                  CocktailIngredient(.otherNonAlc(.hotWater), value: 4),
                                  CocktailIngredient(.whiskies(.irishWhiskeyAny), value: 45, unit: .ml)]

var temperanceIrishCoffeeTags = Tags(flavors: [.coffee],
                                     profiles: [.hot],
                                     styles: [.toddy])
