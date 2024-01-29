//
//  MoergenthalersToddy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var morgenthalersToddy = Cocktail(cocktailName: "Hot Toddy(Morgenthaler’s)",
                                  glasswareType: .toddyGlass,
                                  garnish: [.orangePeel],
                                  author: Author(person: "Jeffrey Morggenthaler", year: "2014"),
                                  spec: morgenthalersToddySpec,
                                  buildOrder: hotToddyWnGBuild,
                                  tags: morgenthalersToddyTags)

var morgenthalersToddySpec  = [CocktailIngredient(.otherNonAlc(.hotWater), value: 3),
                               CocktailIngredient(.juices(.lemon), value: 0.75),
                               CocktailIngredient(.syrups(.morenthalersGingerSyrup), value: 1),
                               CocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .teaspoon),
                               CocktailIngredient(.whiskies(.bourbonAny), value: 1.5)]

var morgenthalersToddyTags = Tags(flavors: [.tea],
                                  profiles: [.hot, .aromatic],
                                  styles: [.toddy])

