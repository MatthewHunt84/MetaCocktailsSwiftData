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
                                 tags: greatWhiteBuffaloTags,
                                 collection: .williamsAndGraham)

let greatWhiteBuffaloSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                                   OldCocktailIngredient(.syrups(.grapefruitShrub), value: 1.25, prep: PrepBible.grapefruitShrub),
                                                   OldCocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                                   OldCocktailIngredient(.seasoning(.saline), value: 5, unit: .drops, prep: PrepBible.fiveToOneSaline),
                                                   OldCocktailIngredient(.vodkas(.zubrowka), value: 1.5)]


let greatWhiteBuffaloTags = Tags(profiles: [.fruity, .refreshing, .light],
                                 styles: [.sour, .shaken])



