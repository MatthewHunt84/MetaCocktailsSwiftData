//
////  MintJulep.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var mintJulep = Cocktail(cocktailName: "Mint Julep",
                         glasswareType: .julep,
                         garnish: [.mintBouquet],
                         ice: .pebbleIce,
                         spec: mintJulepSpec,
                         buildOrder: mintJulepBuild,
                         notes: mintJulepNotes,
                         tags: mintJulepTags,
                         variation: .mintJulep,
                         titleCocktail: true)

let mintJulepSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.syrups(.richDem), value: 0.25, prep: PrepBible.richDem),
                                              OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

let mintJulepTags = Tags(profiles: [.herbal, .sweet, .refreshing],
                         styles: [ .built])


