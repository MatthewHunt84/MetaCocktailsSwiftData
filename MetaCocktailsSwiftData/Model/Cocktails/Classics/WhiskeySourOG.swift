//
//  WhiskeySourOG.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation

var whiskeySourOG = Cocktail(cocktailName: "Whiskey Sour",
                             glasswareType: .stemmedGlassware,
                             garnish: [.maraschinoCherry, .halfOrangeWheel],
                             ice: nil,
                             author: nil,
                             spec: whiskeySourSpecOG,
                             buildOrder: whiskeySourOGBuild,
                             notes: whiskeySourNotes,
                             tags: whiskeySourOGTags,
                             variation: .whiskeySour,
                             titleCocktail: true)

var whiskeySourSpecOG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                          OldCocktailIngredient(.whiskies(.americanWhiskeyAny), value: 2)]

var whiskeySourOGTags = Tags(profiles: [.citrusy, .refreshing, .light, .silky],
                             styles: [.sour, .shaken])

