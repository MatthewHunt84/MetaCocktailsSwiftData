//
//  JackRose.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var jackRose = Cocktail(cocktailName: "Jack Rose",
                        glasswareType: .stemmedGlassware,
                        ice: nil,
                        spec: jackRoseSpec,
                        buildOrder: nil,
                        tags: jackRoseTags)

var jackRoseSpec  = [CocktailIngredient(.juices(.lime), value: 0.5),
                     CocktailIngredient(.syrups(.grenadine), value: 0.25),
                     CocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon),
                     CocktailIngredient(.brandies(.bondedApple), value: 2)]

var jackRoseTags = Tags(profiles: [.citrusy],
                        textures: [.light],
                        styles: [.sour, .shaken])
                    
