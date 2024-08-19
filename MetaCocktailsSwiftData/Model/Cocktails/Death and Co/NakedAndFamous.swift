//
//  NakedAndFamous.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var nakedAndFamous = Cocktail(cocktailName: "Naked and Famous",
                              glasswareType: .stemmedGlassware,
                              garnish: [.noGarnish],
                              ice: nil,
                              author: Author(person: AuthorNames.joaquinSimo.rawValue,
                                             place: AuthorPlaces.deathAndCo.rawValue,
                                             year: "2013"),
                              spec: nakedAndFamousSpec,
                              tags: nakedAndFamousTags,
                              collection: .deathAndCo)

var nakedAndFamousSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                           OldCocktailIngredient(.amari(.aperol), value: 0.75),
                           OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                           OldCocktailIngredient(.agaves(.mezcalDelMagueyChichicapa), value: 0.75)]


var nakedAndFamousTags = Tags(profiles: [.refreshing, .smokey, .herbal, .punchy, .fruity],
                              styles: [.sour, .shaken])

