//
//  WardEight.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation


var wardEight = Cocktail(cocktailName: "Ward Eight",
                         glasswareType: .stemmedGlassware,
                         garnish: [.halfOrangeWheel, .seasonalBerries],
                         ice: nil,
                         author: Author(person: "The Fairbanks Cocktail Popular",
                                        place: "Boston Herald",
                                        year: "August 4, 1907"),
                         spec: wardEightSpec,
                         buildOrder: wardEightBuild,
                         notes: ward8Notes,
                         tags: wardEightTags,
                         collection: .originals)

var wardEightSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.67),
                      OldCocktailIngredient(.juices(.orange), value: 1, unit: .teaspoon),
                      OldCocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .teaspoon),
                      OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .tablespoon, prep: PrepBible.grenadine),
                      OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2),
                      OldCocktailIngredient(.soda(.sodaWater), value: 1)]

var wardEightTags = Tags(profiles: [.citrusy, .light, .fruity, .tart],
                         styles: [.sour, .shaken])


