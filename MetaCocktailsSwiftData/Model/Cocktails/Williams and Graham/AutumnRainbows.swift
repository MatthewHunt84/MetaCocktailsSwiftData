//
//  AutumnRainbows.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var autumnRainbows = Cocktail(cocktailName: "Autumn Rainbows",
                              glasswareType: .martini,
                              garnish: [.lemonWheel],
                              author: Author(person: AuthorNames.christiFelkins.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                              spec: autumnRainbowsSpec,
                              tags: autumnRainbowsTags,
                              collection: .williamsAndGraham)

let autumnRainbowsSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25, prep: PrepBible.demSyrupPrep),
                                                OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                                                OldCocktailIngredient(.amari(.nardiniAmaro), value: 0.75),
                                                OldCocktailIngredient(.whiskies(.eagleRare10), value: 0.75)]


let autumnRainbowsTags = Tags(profiles: [.light, .fruity, .herbal, .punchy],
                              styles: [.sour, .shaken])
