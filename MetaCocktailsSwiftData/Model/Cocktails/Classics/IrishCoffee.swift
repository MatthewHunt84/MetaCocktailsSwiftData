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
                           tags: irishCoffeeTags)

var irishCoffeeSpec  = [CocktailIngredient(.otherNonAlc(.stiffCream), value: 30, unit: .ml),
                        CocktailIngredient(.otherNonAlc(.coffee), value: 75, unit: .ml),
                        CocktailIngredient(.otherNonAlc(.sugarCube), value: 2, unit: .whole),
                        CocktailIngredient(.whiskies(.irishWhiskeyAny), value: 45, unit: .ml)]

var irishCoffeeTags = Tags(flavors: [.coffee],
                           profiles: [.hot, .punchy],
                           styles: [.toddy])

var irishCoffeeBuild = Build(instructions: [Instruction(step: 1, method: "Pre whip the cream so that it doubles in volume"),
                                            Instruction(step: 4, method: "Warm your Irish Coffee glass up by adding hot water to it then drain."),
                                            Instruction(step: 5, method: "Add 2 Demerara or brown sugar cubes to the glass then add the hot coffee and stir to dissolve the sugar. "),
                                            Instruction(step: 6, method: "Then add fresh hot coffee and top with stiff cream."),
                                            Instruction(step: 7, method: "This recipe was reverse engineered in San Francisco to create the famous Irish Coffee at Buena Vista Cafe.")])
