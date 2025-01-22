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
                        author: Author(place: "Bohemian Club, San Francisco", year: "1898"),
                        spec: gibsonSpec,
                        notes: gibsonNote,
                        tags: gibsonTags,
                        variation: .martini,
                        collection: .originals)

var gibsonSpec     =  [OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 0.5),
                       OldCocktailIngredient(.gins(.tanqueray), value: 2.5)]

var gibsonTags     = Tags(profiles: [.spiritForward, .dry],
                          styles: [.martini, .stirred])

