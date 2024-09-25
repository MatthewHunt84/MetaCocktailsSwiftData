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
                        notes: ginsonNotes,
                        tags: gibsonTags,
                        variation: .martini,
                        collection: .originals)

var gibsonSpec     =  [OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 0.5),
                       OldCocktailIngredient(.gins(.tanqueray), value: 2.5)]

var gibsonTags     = Tags(profiles: [.spiritForward, .dry],
                          styles: [.martini, .stirred])

 

var ginsonNotes = "The name of the coctail came from illustrator Charles Dana Gibson, the creator of the Gibson Girl drawings, or Walder D.K. Gibson. Both were members of the club. - Dave Wondrich, The Oxford Companion to Spirits and Cocktails"
