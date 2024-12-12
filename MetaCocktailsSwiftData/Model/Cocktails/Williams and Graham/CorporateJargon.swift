//
//  CorporateJargon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var corporateJargon = Cocktail(cocktailName: "Corporate Jargon",
                               glasswareType: .stemmedGlassware,
                               garnish: nil,
                               author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2021"),
                               spec: corporateJargonSpec,
                               tags: corporateJargonTags,
                               collection: .williamsAndGraham)

let corporateJargonSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.bolivarBitters), value: 3, unit: .dashes),
                                                    OldCocktailIngredient(.syrups(.richCinnamonAndVanilla), value: 1, unit: .barSpoon, prep: PrepBible.richCinnamonAndVanillaSyrupPrep),
                                                 OldCocktailIngredient(.fortifiedWines(.lustauRojoVermouth), value: 0.75),
                                                 OldCocktailIngredient(.brandies(.domCafoBrandy), value: 0.5),
                                                 OldCocktailIngredient(.whiskies(.eagleRare10), value: 1.5)]


let corporateJargonTags = Tags(profiles: [.rich],
                               styles: [.martini, .stirred])

