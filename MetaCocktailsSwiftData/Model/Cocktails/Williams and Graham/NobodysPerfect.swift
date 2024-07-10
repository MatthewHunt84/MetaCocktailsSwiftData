//
//  NobodysPerfect.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var nobodysPerfect = Cocktail(cocktailName: "Nobody's Perfect",
                              glasswareType: .stemmedGlassware,
                              garnish: [.flamedOrange],
                              ice: nil,
                              author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                              spec: nobodysPerfectSpec,
                              buildOrder: nil,
                              tags: nobodysPerfectTags,
                              collection: .williamsAndGraham)

var nobodysPerfectSpec  = [OldCocktailIngredient(.amari(.braulio), value: 0.5),
                           OldCocktailIngredient(.fortifiedWines(.lustauBlancVermouth), value: 0.75),
                           OldCocktailIngredient(.fortifiedWines(.lustauRojoVermouth), value: 0.75),
                           OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]

var nobodysPerfectTags = Tags(profiles: [.herbal, .punchy, .spiritForward, .complex],
                              styles: [.stirred, .manhattan])
