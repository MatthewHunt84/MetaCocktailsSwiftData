//
//  CorporateJargon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var corporateJargon = Cocktail(cocktailName: "Corporate Jargon",
                               imageAsset: nil,
                               glasswareType: .stemmedGlassware,
                               garnish: nil,
                               author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2021"),
                               spec: corporateJargonSpec,
                               tags: corporateJargonTags)

let corporateJargonSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.bolivarBitters), value: 3, unit: .dashes),
                                                 CocktailIngredient(.syrups(.richCinnamonAndVanilla), value: 1, unit: .barSpoon),
                                                 CocktailIngredient(.fortifiedWines(.lustauRojoVermouth), value: 0.75),
                                                 CocktailIngredient(.brandies(.domCafoBrandy), value: 0.5),
                                                 CocktailIngredient(.whiskies(.eagleRare10), value: 1.5)]


let corporateJargonTags = Tags(profiles: [.rich],
                               styles: [.martini, .stirred])

