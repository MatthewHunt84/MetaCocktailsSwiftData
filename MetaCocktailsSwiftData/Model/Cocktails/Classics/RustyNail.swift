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

var rustyNailNotes = "Dave Wondrich says that the name 'Rusty Nail' wasn't recorded until 1961 and that the combination of Drambuie and Scotch is probably as old as when Drambuie was produced (1908). Dave is the man to listen to for anythin cocktail history related, so we'll listen to him. That's the reaon we aren't showing an author here."
