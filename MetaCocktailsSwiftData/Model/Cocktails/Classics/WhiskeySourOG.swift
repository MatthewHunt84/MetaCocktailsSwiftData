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
                             tags: whiskeySourOGTags,
                             variation: .whiskeySour,
                             collection: .originals,
                             titleCocktail: true)

var whiskeySourSpecOG  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                          OldCocktailIngredient(.whiskies(.americanWhiskeyAny), value: 2)]

var whiskeySourOGTags = Tags(profiles: [.citrusy, .refreshing, .light, .silky],
                             styles: [.sour, .shaken])

var whiskeySourOGBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the bitters into a tin a dry shake to emulsify"),
                                              Instruction(step: 2, method: "And a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                              Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain into a stemmed glass.")])

var whiskeySourNotes = "Dave Wondrich says that the first print of the name 'Whiskey Sour' shows up in print as early as 1826. This is another example of a cocktail that hundreds of people thought they invented. Like the Old Fashioned, it's long been a staple in the cocktail world. The addition of egg whites have always been optional but we think that it significantly improves the cocktail."
