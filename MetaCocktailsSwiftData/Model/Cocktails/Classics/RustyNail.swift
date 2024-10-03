//
//  RustyNail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation

var rustyNail = Cocktail(cocktailName: "Rusty Nail",
                         glasswareType: .doubleOld,
                         garnish: nil,
                         ice: .bigRock,
                         spec: rustyNailSpec,
                         notes: rustyNailNotes,
                         tags: rustyNailTags,
                         variation: .rustyNail,
                         collection: .originals,
                         titleCocktail: true)

var rustyNailSpec     =  [OldCocktailIngredient(.liqueurs(.drambuie), value: 1),
                          OldCocktailIngredient(.whiskies(.scotchBlended), value: 2)]

var rustyNailTags     = Tags(profiles: [.spiritForward, .punchy, .sweet],
                             styles: [.oldFashioned, .stirred])
