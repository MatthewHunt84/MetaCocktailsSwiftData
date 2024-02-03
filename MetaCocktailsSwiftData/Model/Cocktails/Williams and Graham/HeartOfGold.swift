//
//  HeartOfGold.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var heartOfGold = Cocktail(cocktailName: "Heart of Gold",
                           imageAsset: nil,
                           glasswareType: .stemmedGlassware,
                           garnish: nil,
                           author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                           spec: heartOfGoldSpec,
                           tags: heartOfGoldTags)

let heartOfGoldSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.pimentoBitters), value: 2, unit: .dashes),
                                             CocktailIngredient(.amari(.angosturaAmaro), value: 0.75),
                                             CocktailIngredient(.amari(.amaroNonino), value: 0.75),
                                             CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 0.75),
                                             CocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 0.75),
                                             CocktailIngredient(.whiskies(.Ardbeg), value: 1, unit: .glassRinse)]


let heartOfGoldTags = Tags(profiles: [.rich],
                           styles: [.martini, .stirred])

