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



