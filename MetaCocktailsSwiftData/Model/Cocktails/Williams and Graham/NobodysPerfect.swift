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
                              tags: nobodysPerfectTags)

var nobodysPerfectSpec  = [CocktailIngredient(.amari(.braulio), value: 0.5),
                           CocktailIngredient(.fortifiedWines(.lustauBlancVermouth), value: 0.75),
                           CocktailIngredient(.fortifiedWines(.lustauRojoVermouth), value: 0.75),
                           CocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]

var nobodysPerfectTags = Tags(profiles: [.herbal, .punchy, .spiritForward, .complex],
                              styles: [.stirred, .manhattan])
