//
//  PinceEdward.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var princeEdward = Cocktail(cocktailName: "Prince Edward (W&G Version)",
                            glasswareType: .nickAndNora,
                            garnish: [.orangePeel],
                            author: williamsAndGraham,
                            spec: princeEdwardSpec,
                            tags: princeEdwardTags,
                            variation: .princeEdward,
                            collection: .williamsAndGraham)

var princeEdwardSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                             OldCocktailIngredient(.liqueurs(.drambuie), value: 0.25),
                             OldCocktailIngredient(.fortifiedWines(.lilletBlanc), value: 0.75),
                             OldCocktailIngredient(.whiskies(.compassBoxOrchard), value: 1.5)]

var princeEdwardTags    = Tags(flavors: [.orange],
                               profiles: [.spiritForward],
                               styles: [.martini, .stirred])

