//
//  BobbyBurns.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bobbyBurns = Cocktail(cocktailName: "Bobby Burns" + historicTag,
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          author: Author(person: AuthorNames.hugoEnsslin.rawValue, place: AuthorPlaces.recipesForMixedDrinks.rawValue, year: "1916"),
                          spec: bobbyBurnsSpec,
                          notes: bobbyBurnsNote,
                          tags: bobbyBurnsTags,
                          variation: .bobbyBurns,
                          collection: .originals,
                          historicSpec: .bobbyBurns)

var bobbyBurnsSpec     =  [OldCocktailIngredient(.liqueurs(.benedictine), value: 0.75),
                           OldCocktailIngredient(.fortifiedWines(.dolinRouge), value: 1.5),
                           OldCocktailIngredient(.whiskies(.glenfiddich12), value: 1.5)]

var bobbyBurnsTags     = Tags(flavors: [.lemon],
                              profiles: [.spiritForward,  .rich],
                              styles: [.manhattan, .stirred])


