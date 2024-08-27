//
//  Carajillo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let carajillo = Cocktail(cocktailName: "Carajillo",
                         glasswareType: .singleOld,
                         ice: .crackedIce,
                         author: Author(place: "Spain, probably. This is another one with a murky past."),
                         spec: carajilloSpec,
                         tags: carajilloTags,
                         collection: .originals)

var carajilloSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.coldBrew), value: 1.5),
                                              OldCocktailIngredient(.liqueurs(.licor43), value: 1.5)]

var carajilloTags = Tags(profiles: [.punchy, .bittersweet],
                         styles: [.shaken])


