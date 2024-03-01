//
//  AppleJackCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var appleJackCocktail = Cocktail(cocktailName: "Apple Jack Cocktail",
                                 glasswareType: .stemmedGlassware,
                                 garnish: nil,
                                 ice: nil,
                                 author: harryCraddock,
                                 spec: appleJackCocktailSpec,
                                 buildOrder: nil,
                                 tags: appleJackCocktailTags,
                                 variation: .appleJackCocktail,
                                 collection: .originals)

var appleJackCocktailSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                  CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                                  CocktailIngredient(.brandies(.boulardCalvados), value: 1.5)]

var appleJackCocktailTags     = Tags(profiles: [.fruity, .spiritForward, .bittersweet],
                                     styles: [.martini, .shaken])
