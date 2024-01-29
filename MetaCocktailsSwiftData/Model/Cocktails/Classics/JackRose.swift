//
//  JackRose.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var jackRose = Cocktail(cocktailName: "Jack Rose",
                           glasswareType: .stemmedGlassware,
                           garnish: [.limeWheel],
                           ice: nil,
                           author: Author(person: "Frank Hass",
                                          place: "Fred Eberlin's(Downtown bar), New York",
                                          year: "1899"),
                           spec: jackRoseSpecWnG,
                           buildOrder: nil,
                           tags: jackRoseTags)

var jackRoseSpecWnG  = [CocktailIngredient(.juices(.lime), value: 0.5),
                        CocktailIngredient(.syrups(.grenadine), value: 0.5),
                        CocktailIngredient(.brandies(.lairdsApplejack), value: 2)]

var jackRoseTags = Tags(profiles: [.citrusy, .light, .fruity, .refreshing],
                        styles: [.sour, .shaken])

