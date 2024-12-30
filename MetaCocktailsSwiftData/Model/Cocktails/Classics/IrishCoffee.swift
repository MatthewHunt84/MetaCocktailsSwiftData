//
//  IrishCoffee.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var irishCoffee = Cocktail(cocktailName: "Irish Coffee",
                           glasswareType: .buenaVistaIrish,
                           garnish: nil,
                           author: Author(person: "Joe Sheridan", place: "Flying Boat Station. Foynes, Ireland", year: "1944"),
                           spec: irishCoffeeSpec,
                           buildOrder: irishCoffeeBuild,
                           tags: irishCoffeeTags,
                           variation: .irishCoffee,
                           collection: .originals,
                           titleCocktail: true)

var irishCoffeeSpec  = [OldCocktailIngredient(.otherNonAlc(.stiffCream), value: 1, unit: .fluidOunces),
                        OldCocktailIngredient(.otherNonAlc(.coffee), value: 2.5, unit: .fluidOunces),
                        OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 2, unit: .whole),
                        OldCocktailIngredient(.whiskies(.irishWhiskeyAny), value: 1.5, unit: .fluidOunces)]

var irishCoffeeTags = Tags(flavors: [.coffee],
                           profiles: [.hot, .punchy],
                           styles: [.toddy])


