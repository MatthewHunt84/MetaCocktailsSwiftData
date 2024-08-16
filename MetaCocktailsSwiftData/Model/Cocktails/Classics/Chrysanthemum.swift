//
//  Chrysanthemum.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var chrysanthemum = Cocktail(cocktailName: "Chrysanthemum",
                             glasswareType: .coupe,
                             garnish: [.orangePeel],
                             ice: nil,
                             author: Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                             spec:chrysanthemumSpec,
                             tags: chrysanthemumTags)

var chrysanthemumSpec  = [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 3, unit: .dashes),
                          OldCocktailIngredient(.liqueurs(.benedictine), value: 1),
                          OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 2)]



var chrysanthemumTags = Tags(flavors: [.orange],
                             profiles: [.herbal, .rich],
                             styles: [.martini, .stirred])

