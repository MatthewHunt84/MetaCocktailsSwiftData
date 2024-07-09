//
//  FallbackCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var fallbackCocktail = Cocktail(cocktailName: "Fallback Cocktail",
                                glasswareType: .doubleOld,
                                garnish: [.orangePeel],
                                ice: .bigRock,
                                author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                               place: AuthorPlaces.johnDoryOysterBar.rawValue,
                                               year: "Early 2000s"),
                                spec: vieuxCarreSpec,
                                tags: vieuxCarreTags,
                                collection: .milkAndHoney)

var fallbackCocktailSpec     =  [OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                 OldCocktailIngredient(.amari(.amaroNonino), value: 0.5),
                                 OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.5),
                                 OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                                 OldCocktailIngredient(.brandies(.lairdsApplejack), value: 1)]

var fallbackCocktailTags     = Tags(profiles: [.spiritForward, .rich, .punchy, .bittersweet],
                                    styles: [.manhattan, .stirred])

