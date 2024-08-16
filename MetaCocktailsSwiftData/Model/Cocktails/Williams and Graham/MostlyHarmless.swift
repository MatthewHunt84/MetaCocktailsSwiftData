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
                               tags: mostelyHarmlessTags,
                               collection: .williamsAndGraham)

let mostelyHarmlessSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                    OldCocktailIngredient(.otherNonAlc(.orangeConcentrate), value: 0.25),
                                                    OldCocktailIngredient(.syrups(.vanilla), value: 0.25, prep: PrepBible.vanillaSyrup),
                                                    OldCocktailIngredient(.liqueurs(.dryCuracao), value: 0.5),
                                                    OldCocktailIngredient(.liqueurs(.licor43), value: 0.75),
                                                    OldCocktailIngredient(.whiskies(.wlWeller90), value: 0.75),
                                                    OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]


let mostelyHarmlessTags = Tags(profiles: [.refreshing, .citrusy, .fruity, .rich],
                               styles: [.sour, .flip, .shaken])

