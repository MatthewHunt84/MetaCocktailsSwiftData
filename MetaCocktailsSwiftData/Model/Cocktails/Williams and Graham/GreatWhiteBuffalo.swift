//
//  GreatWhiteBuffalo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var greatWhiteBuffalo = Cocktail(cocktailName: "Great White Buffalo",
                                 imageAsset: nil,
                                 glasswareType: .collins,
                                 garnish: [.lemongrass, .chineseFiveSpice],
                                 ice: .pebbleIce,
                                 author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                               place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                                 spec: greatWhiteBuffaloSpec,
                                 tags: greatWhiteBuffaloTags)

let greatWhiteBuffaloSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.25),
                                                   CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBibleViewModel().grapefruitShrub),
                                                   CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                                   CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                                   CocktailIngredient(.vodkas(.zubrowka), value: 1.5)]


let greatWhiteBuffaloTags = Tags(profiles: [.fruity, .refreshing, .light],
                                 styles: [.sour, .shaken])



