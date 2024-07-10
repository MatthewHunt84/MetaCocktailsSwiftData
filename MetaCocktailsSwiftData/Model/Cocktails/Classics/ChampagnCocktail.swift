//
//  ChampagnCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var champagneCocktail = Cocktail(cocktailName: "Champagne Cocktail",
                         glasswareType: .flute,
                         garnish: [.noGarnish],
                         ice: nil,
                         author:Author(place: "Some American Bar in Panama", year: "1855"),
                         spec: champagneCocktailSpec,
                         tags: champagneCocktailTags)

var champagneCocktailSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                      OldCocktailIngredient(.wines(.champagne), value: 5)]

var champagneCocktailTags = Tags(profiles: [.dry, .effervescent, .bitter],
                         styles: [.built])



