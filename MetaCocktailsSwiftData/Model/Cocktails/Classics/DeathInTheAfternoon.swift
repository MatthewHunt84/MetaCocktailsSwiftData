//
//  DeathInTheAfternoon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var deathInTheAfternoon  = Cocktail(cocktailName: "Death in the Afternoon",
                                    glasswareType: .flute,
                                    garnish: [.lemonPeel],
                                    author: Author(person: AuthorNames.ernestHemingway.rawValue, year: "1935"),
                                    spec: deathInTheAfternoonSpec,
                                    tags: deathInTheAfternoonTags,
                                    collection: .originals)

var deathInTheAfternoonSpec  = [OldCocktailIngredient(.wines(.champagne), value: 4),
                                OldCocktailIngredient(.otherAlcohol(.absinthe), value: 1.5)]



var deathInTheAfternoonTags   = Tags(flavors: [.lemon],
                                     profiles: [.herbal, .punchy, .effervescent],
                                     styles: [.fizz, .built])

