//
//  BlueBlazer.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var blueBlazer = Cocktail(cocktailName: "Blue Blazer",
                          glasswareType: .blueBlazerMugs,
                          garnish: [.lemonPeel],
                          author: jerryThomas,
                          spec: blueBlazerSpec,
                          buildOrder: blueBlazerBuild,
                          tags: blueBlazerTags,
                          collection: .originals)

var blueBlazerSpec  = [OldCocktailIngredient(.otherNonAlc(.hotWater), value: 2),
                       OldCocktailIngredient(.otherNonAlc(.sugarCube), value: 2, unit: .whole),
                       OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                       OldCocktailIngredient(.whiskies(.aberlourAbundah), value: 2)]

var blueBlazerTags = Tags(flavors: [.lemon, .tea],
                          profiles: [.hot],
                          styles: [.toddy])

