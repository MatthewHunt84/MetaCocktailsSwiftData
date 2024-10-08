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
                         spec: carajilloSpec,
                         notes: carajilloNotes,
                         tags: carajilloTags)

var carajilloSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.espressoShot), value: 1, unit: .none),
                                              OldCocktailIngredient(.liqueurs(.licor43), value: 1.5)]

var carajilloTags = Tags(profiles: [.punchy, .bittersweet],
                         styles: [.shaken])
