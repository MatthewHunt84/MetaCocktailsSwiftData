//
//  MostlyHarmless.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var mostelyHarmless = Cocktail(cocktailName: "Mostly Harmless",
                               imageAsset: nil,
                               glasswareType: .milkShake,
                               garnish: [.orangePeelLong , .mintLeaf2],
                               ice: .pebbleIce,
                               author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2021"),
                               spec: mostelyHarmlessSpec,
                               tags: mostelyHarmlessTags)

let mostelyHarmlessSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.5),
                                                 CocktailIngredient(.otherNonAlc(.orangeConcentrate), value: 0.25),
                                                 CocktailIngredient(.syrups(.vanilla), value: 0.25),
                                                 CocktailIngredient(.liqueurs(.dryCuracao), value: 0.5),
                                                 CocktailIngredient(.liqueurs(.licor43), value: 0.75),
                                                 CocktailIngredient(.whiskies(.wlWeller90), value: 0.75),
                                                 CocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]


let mostelyHarmlessTags = Tags(profiles: [.refreshing, .citrusy, .fruity, .rich],
                               styles: [.sour, .flip, .shaken])

