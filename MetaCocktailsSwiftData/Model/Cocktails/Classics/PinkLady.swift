//
//  PinkLady.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var pinkLady = Cocktail(cocktailName: "Pink Lady",
                        glasswareType: .stemmedGlassware,
                        garnish: nil,
                        author: Author(person: "Jacques Straub",
                                       place: "Straub's Manual of Mixed Drinks.",
                                       year: "1901"),
                        spec: pinkLadySpec,
                        tags: pinkLadyTags,
                        collection: .originals)

var pinkLadySpec  = [CocktailIngredient(.juices(.lime), value: 0.5),
                     CocktailIngredient(.syrups(.grenadine), value: 0.5, info: Syrup.grenadine.grenadineInfo),
                     CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5),
                     CocktailIngredient(.brandies(.bondedApple), value: 1),
                     CocktailIngredient(.gins(.ginAny), value: 1)]


var pinkLadyTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                        styles: [.sour, .shaken])

