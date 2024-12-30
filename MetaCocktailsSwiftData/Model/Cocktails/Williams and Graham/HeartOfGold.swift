//
//  HeartOfGold.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var heartOfGold = Cocktail(cocktailName: "Heart of Gold",
                           glasswareType: .stemmedGlassware,
                           garnish: nil,
                           author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2020"),
                           spec: heartOfGoldSpec,
                           buildOrder: heartOfGoldBuild,
                           tags: heartOfGoldTags,
                           collection: .williamsAndGraham)

let heartOfGoldSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.pimentoBitters), value: 2, unit: .dashes),
                                             OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.75),
                                             OldCocktailIngredient(.amari(.amaroNonino), value: 0.75),
                                             OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 0.75),
                                             OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 0.75),
                                             OldCocktailIngredient(.whiskies(.ardbeg), value: 3, unit: .sprays)]


let heartOfGoldTags = Tags(profiles: [.rich],
                           styles: [.martini, .stirred])



