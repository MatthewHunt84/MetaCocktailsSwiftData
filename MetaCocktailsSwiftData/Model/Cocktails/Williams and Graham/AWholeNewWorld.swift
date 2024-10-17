//
//  AWholeNewWorld.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/16/24.
//

import Foundation

var aWholeNewWorld = Cocktail(cocktailName: "A Whole New World",
                              glasswareType: .collins,
                              garnish: [.bambooLeaf],
                              ice: .pebbleIce,
                              author: Author(person: "James Menkal", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                              spec: aWholeNewWorldSpec,
                              tags: aWholeNewWorldTags,
                              collection: .williamsAndGraham)

let aWholeNewWorldSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.5),                                                                                                  OldCocktailIngredient(.syrups(.clementineShrub), value: 1, prep: PrepBible.clementineShrub),
                                                   OldCocktailIngredient(.gins(.woodyCreekGinJasmine), value: 1.5, prep: PrepBible.jasmineTeaInfusedGin)]


let aWholeNewWorldTags = Tags(profiles: [.refreshing, .complex, .fruity],
                              styles: [.sour, .shaken])

