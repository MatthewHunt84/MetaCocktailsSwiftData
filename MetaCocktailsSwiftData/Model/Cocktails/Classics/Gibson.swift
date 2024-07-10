//
//  Gibson.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var gibson   = Cocktail(cocktailName: "Gibson",
                        glasswareType: .martini,
                        garnish: [.cocktailOnion],
                        spec: gibsonSpec,
                        tags: gibsonTags,
                        variation: .martini)

var gibsonSpec     =  [OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 0.5),
                       OldCocktailIngredient(.gins(.tanqueray), value: 2.5)]

var gibsonTags     = Tags(profiles: [.spiritForward, .dry],
                          styles: [.martini, .stirred])

