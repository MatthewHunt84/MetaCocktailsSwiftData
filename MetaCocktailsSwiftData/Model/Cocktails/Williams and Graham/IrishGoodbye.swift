//
//  IrishGoodbye.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var irishGoodbye = Cocktail(cocktailName: "Irish Goodbye",
                            glasswareType: .doubleOld,
                            garnish: nil,
                            ice: .bigRock,
                            author: Author(person: "Sam Scarlett", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                            spec: heartOfGoldSpec,
                            tags: heartOfGoldTags,
                            collection: .williamsAndGraham)

let irishGoodbyeSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                              OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                                              OldCocktailIngredient(.amari(.chinaChina), value: 0.5),
                                              OldCocktailIngredient(.liqueurs(.dolinGenepy), value: 0.75),
                                              OldCocktailIngredient(.whiskies(.powersIrish), value: 1.5)]


let irishGoodbyeTags = Tags(profiles: [.rich],
                            styles: [.martini, .stirred])


let irishGoodbyeBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the absinthe, into a mixing glass with ice and stir."),
                                             Instruction(step: 2, method: "Prepare a double old fashioned glass by rinsing it with absinthe. We use about 5 sprays but you can swirl a 1/4 oz. of absinthe in the glass if you don't have an atomizer."),
                                             Instruction(step: 3, method: "Add a large rock and strain the cocktail into the prepared glass.")])
