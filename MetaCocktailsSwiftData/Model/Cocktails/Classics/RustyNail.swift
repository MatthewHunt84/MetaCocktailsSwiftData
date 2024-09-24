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

var rustyNailNotes = "According to cocktail historian Dave Wondrich, the name 'Rusty Nail' wasn't documented until 1961. However, the combination of Drambuie and Scotch likely dates back to 1908 when Drambuie began production. Given Wondrich's reputation as a leading authority on cocktail history, his research on this topic is considered highly reliable. The absence of a specific creator attribution for the Rusty Nail reflects the drink's unclear origins and the general consensus among experts about its history."
