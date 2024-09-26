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


let carajilloNotes = "Licor 43, a sweet vanilla-based Spanish liqueur, was first produced by the Zamora family in 1946. Its natural affinity with espresso led to a popular cocktail combination. When shaken with ice, this mixture creates a foamy texture, with the coffee's bitterness balancing the liqueur's sweetness. The drink's origins are unclear, but it likely emerged from Spain. This cocktail is a great example of how technique is everything."
