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
                                        place: "Boston Herald, sec. 2, 12",
                                        year: "August 4, 1907"),
                         spec: wardEightSpec,
                         buildOrder: wardEightBuild,
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

var wardEightBuild = Build(instructions: [Instruction(step: 1, method: "There's a lot of speculation as to where this cocktail comes from. Here, we're using the oldest version that we could find that seems to be in line with how modern bartenders are presenting it."),
                                          Instruction(step: 2, method: "It says the orange juice or orange Curaçao is optional. But this seems to be a common modern through line. So, we added it to the spec."),
                                          Instruction(step: 3, method: "However you make it, add the sparkling water last after you've shaken and strained the cocktail.")])
