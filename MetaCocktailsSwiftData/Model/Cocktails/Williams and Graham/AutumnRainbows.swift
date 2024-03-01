//
//  AutumnRainbows.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var autumnRainbows = Cocktail(cocktailName: "Autumn Rainbows",
                              imageAsset: nil,
                              glasswareType: .martini,
                              garnish: [.lemonWheel],
                              author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: autumnRainbowsSpec,
                              tags: autumnRainbowsTags,
                              collection: .williamsAndGraham)

let autumnRainbowsSpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25),
                                                CocktailIngredient(.juices(.lemon), value: 0.5),
                                                CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                                                CocktailIngredient(.amari(.nardiniAmaro), value: 0.75),
                                                CocktailIngredient(.whiskies(.eagleRare10), value: 0.75)]


let autumnRainbowsTags = Tags(profiles: [.light, .fruity, .herbal, .punchy],
                              styles: [.sour, .shaken])
