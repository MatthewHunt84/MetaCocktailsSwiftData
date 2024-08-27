//
//  Jasmine.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var jasmine = Cocktail(cocktailName: "Jasmine",
                       glasswareType: .stemmedGlassware,
                       garnish: [.lemonPeel],
                       ice: nil,
                       author:Author(person: AuthorNames.paulHarrington.rawValue, place: "Townhouse Bar & Grill, Emeryville", year: "1998"),
                       spec: jasmineSpec,
                       tags: jasmineTags,
                       variation: .peguClub)

var jasmineSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                    OldCocktailIngredient(.gins(.ginLondonDry), value: 1.5),
                    OldCocktailIngredient(.liqueurs(.cointreau), value: 0.25),
                    OldCocktailIngredient(.amari(.campari), value: 0.25)]

var jasmineTags = Tags(profiles: [.citrusy, .tart, .bitter],
                       styles: [.daisy, .shaken, .sour])

