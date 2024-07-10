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
                       author:Author(place: "Somewhere in New Orleans in", year: "1800s"),
                       spec: sazeracSpec,
                       buildOrder: sazeracBuild,
                       tags: sazeracTags,
                       variation: .sazerac,
                       collection: .originals,
                       titleCocktail: true)

var sazeracSpec  = [OldCocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon, prep: PrepBible.richDem),
                    OldCocktailIngredient(.brandies(.cognacVSOP), value: 2),
                    OldCocktailIngredient(.bitters(.peychauds), value: 4, unit: .dashes),
                    OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                    OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),]

var sazeracTags = Tags(profiles: [.spiritForward, .punchy],
                       styles: [.oldFashioned, .stirred])

var sazeracBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the absinthe into a mixing glass with ice and stir until cold."),
                                        Instruction(step: 2, method: "Spray your frozen single old fashioned glass with 5 spritzes of absinthe. Another option is to ad 1/4 oz. into the glass and spin to glaze the inside. "),
                                        Instruction(step: 3, method: "Add your cocktail to the rinsed glass"),
                                        Instruction(step: 5, method: "Garnish with a lemon twist."),
                                        Instruction(step: 5, method: "This is a more modern version that you'll find at upscale cocktail bars. This is also our prefered version of the Sazerac. Making a rich dem adds texture to the cocktail and also has the added benifit of fully emulsifying. A sugar cube does not.")])
                     


