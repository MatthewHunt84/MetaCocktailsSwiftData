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

var pinkLadySpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.syrups(.grenadine), value: 0.5),
                     OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5, prep: PrepBible.grenadine),
                     OldCocktailIngredient(.brandies(.bondedApple), value: 1),
                     OldCocktailIngredient(.gins(.ginAny), value: 1)]


var pinkLadyTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                        styles: [.sour, .shaken])

