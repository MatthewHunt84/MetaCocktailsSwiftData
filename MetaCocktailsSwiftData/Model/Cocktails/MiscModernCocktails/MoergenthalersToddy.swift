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
                                  tags: morgenthalersToddyTags,
                                  variation: .hotToddy)

var morgenthalersToddySpec  = [OldCocktailIngredient(.otherNonAlc(.hotWater), value: 3),
                               OldCocktailIngredient(.juices(.lemon), value: 0.75),
                               OldCocktailIngredient(.syrups(.morenthalersGingerSyrup), value: 1, prep: PrepBible.morgenthalersGingerSyrup),
                               OldCocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .teaspoon),
                               OldCocktailIngredient(.whiskies(.bourbonAny), value: 1.5)]

var morgenthalersToddyTags = Tags(flavors: [.tea, .orange],
                                  profiles: [.hot, .aromatic],
                                  styles: [.toddy])

