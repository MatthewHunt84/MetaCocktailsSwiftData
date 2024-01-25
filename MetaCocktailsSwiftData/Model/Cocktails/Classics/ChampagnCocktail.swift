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
                         ice: .koldDraft,
                         author:Author(place: "Some American Bar in Panama", year: "1855"),
                         spec: champagneCocktailSpec,
                         tags: champagneCocktailTags)

var champagneCocktailSpec  = [CocktailIngredient(.liqueurs(.borghetti), value: 1),
                      CocktailIngredient(.vodkas(.vodkaAny), value: 2),
                      CocktailIngredient(.otherNonAlc(.cream), value: 0.5)]

var champagneCocktailTags = Tags(profiles: [.dry, .effervescent, .bitter],
                         styles: [.built])



