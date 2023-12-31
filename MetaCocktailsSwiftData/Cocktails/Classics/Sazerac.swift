////
////  Sazerac.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var sazerac = Cocktail(cocktailName: "Sazerac",
                       glasswareType: .singleOld,
                       garnish: [.lemonPeel],
                       ice: nil,
                       author: "Somewhere in New Orleans in the 1800's",
                       spec: sazeracSpec,
                       buildOrder: sazeracBuild,
                       tags: sazeracTags)

var sazeracSpec  = [CocktailIngredient(.syrups(.richDem), value: 2, unit: .barspoon),
                    CocktailIngredient(.whiskies(.ryeWhiskey), value: 2),
                    CocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                    CocktailIngredient(.bitters(.peychauds), value: 4, unit: .dash),
                    CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash)]

var sazeracTags = Tags(profiles: [.spiritForward],
                       textures: [.rich],
                       styles: [.oldFashioned, .stirred])

var sazeracBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the absinthe into a mixing glass and stir until cold."),
                                        Instruction(step: 2, method: "Spray your frozen single old fashioned glass with 5 spritzes of absinthe. Another option is to ad 1/4 oz. into the glass and spin to glaze the inside. "),
                                        Instruction(step: 3, method: "Add your cocktail to the rinsed glass"),
                                        Instruction(step: 4, method: "Garnish with a lemon twist."),
                                        Instruction(step: 5, method: "The original was done with Cognac. Try it! It doesn't suck.")])
                     
