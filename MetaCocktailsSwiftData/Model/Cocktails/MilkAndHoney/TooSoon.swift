//
//  TooSoon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var tooSoon = Cocktail(cocktailName: "Too Soon?",
                       glasswareType: .doubleOld,
                       garnish: nil,
                       ice: nil,
                       author:Author(person: AuthorNames.samRoss.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                       spec: tooSoonSpec,
                       buildOrder: nil,
                       tags: tooSoonTags,
                       collection: .milkAndHoney)

var tooSoonSpec     =  [CocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                        CocktailIngredient(.syrups(.simple), value: 0.5),
                        CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.amari(.cynar), value: 1),
                        CocktailIngredient(.gins(.ginAny), value: 1)]

var tooSoonTags     = Tags(profiles: [.light, .refreshing, .citrusy, .complex],
                           styles: [.sour, .shaken])
