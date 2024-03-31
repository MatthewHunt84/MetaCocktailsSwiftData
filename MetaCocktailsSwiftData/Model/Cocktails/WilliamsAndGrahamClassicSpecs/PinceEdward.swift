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
                            collection: .williamsAndGraham)

var princeEdwardSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                             CocktailIngredient(.liqueurs(.drambuie), value: 0.25),
                             CocktailIngredient(.fortifiedWines(.lilletBlanc), value: 0.75),
                             CocktailIngredient(.whiskies(.compassBoxOrchard), value: 1.5)]

var princeEdwardTags    = Tags(profiles: [.spiritForward],
                               styles: [.martini, .stirred])

