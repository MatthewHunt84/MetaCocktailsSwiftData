//
//  Jasmine.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 4/13/24.
//

import Foundation

var jasmine = Cocktail(cocktailName: "Jasmine",
                       glasswareType: .stemmedGlassware,
                       garnish: [.lemonPeel],
                       author: Author(person: AuthorNames.paulHarrington.rawValue, place:  "Cocktail: The Drinks Bible for the 21st Century", year: "1998"),
                       spec: cableCarSpec,
                       tags: cableCarTags)

var jasmineSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                    CocktailIngredient(.liqueurs(.cointreau), value: 0.25),
                    CocktailIngredient(.amari(.campari), value: 0.25),
                    CocktailIngredient(.gins(.ginAny), value:1.5)]

var jasmineTags = Tags(profiles: [.citrusy, .fruity, .tart],
                       styles: [.sour, .shaken])

