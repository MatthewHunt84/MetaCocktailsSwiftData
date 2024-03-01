//
//  IrishGoodbye.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var irishGoodbye = Cocktail(cocktailName: "Irish Goodbye",
                            imageAsset: nil,
                            glasswareType: .doubleOld,
                            garnish: nil,
                            ice: .bigRock,
                            author: Author(person: "Sam Scarlett", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                            spec: heartOfGoldSpec,
                            tags: heartOfGoldTags,
                            collection: .williamsAndGraham)

let irishGoodbyeSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                              CocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .spraysInGlass),
                                              CocktailIngredient(.amari(.chinaChina), value: 0.5),
                                              CocktailIngredient(.liqueurs(.dolinGenepy), value: 0.75),
                                              CocktailIngredient(.whiskies(.powersIrish), value: 1.5)]


let irishGoodbyeTags = Tags(profiles: [.rich],
                            styles: [.martini, .stirred])

