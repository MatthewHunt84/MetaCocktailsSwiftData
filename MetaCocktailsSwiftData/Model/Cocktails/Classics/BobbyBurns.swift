//
//  BobbyBurns.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bobbyBurns = Cocktail(cocktailName: "Bobby Burns",
                         glasswareType: .nickAndNora,
                         garnish: [.lemonPeel],
                          author: Author(person: AuthorNames.hugoEnsslin.rawValue, place: AuthorPlaces.recipesForMixedDrinks.rawValue, year: "1916"),
                         spec: bobbyBurnsSpec,
                         tags: bobbyBurnsTags)

var bobbyBurnsSpec     =  [CocktailIngredient(.liqueurs(.benedictine), value: 0.75),
                           CocktailIngredient(.fortifiedWines(.dolinRouge), value: 1.5),
                           CocktailIngredient(.whiskies(.glenfiddich12), value: 1.5)]

var bobbyBurnsTags     = Tags(profiles: [.spiritForward, .sophisticated, .rich],
                          styles: [.manhattan, .stirred])
