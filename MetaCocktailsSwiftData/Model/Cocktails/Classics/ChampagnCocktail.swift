//
//  ChampagnCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var champagneCocktail = Cocktail(cocktailName: "Champagne Cocktail",
                                 glasswareType: .flute,
                                 garnish: [.lemonPeel],
                                 ice: nil,
                                 author: harryCraddock,
                                 spec: champagneCocktailSpec,
                                 tags: champagneCocktailTags,
                                 collection: .originals)

var champagneCocktailSpec  = [OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 1, unit: .none),
                              OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                              OldCocktailIngredient(.wines(.champagne), value: 5)]

var champagneCocktailTags = Tags(flavors: [.lemon],
                                 profiles: [.dry, .effervescent, .bitter],
                                 styles: [.built])



