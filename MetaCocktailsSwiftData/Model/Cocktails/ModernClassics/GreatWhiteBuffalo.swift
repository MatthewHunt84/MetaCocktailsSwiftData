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
                                 author: "James Menkal (Williams and Graham)",
                                 spec: greatWhiteBuffaloSpec,
                                 tags: greatWhiteBuffaloTags)

let greatWhiteBuffaloSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.25),
                                                   CocktailIngredient(.syrups(.grapefruitShrub), value: 1.25),
                                                   CocktailIngredient(.liqueurs(.licor43), value: 0.5),
                                                   CocktailIngredient(.seasoning(.saline), value: 5, unit: .drops),
                                                   CocktailIngredient(.vodkas(.zubrowka), value: 1.5)]


let greatWhiteBuffaloTags = Tags(profiles: [.herbal, .refreshing],
                      textures: [.light],
                      styles: [.sour, .shaken])



