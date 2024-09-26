//
//  HoneymoonEmbury.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var honeymoonCocktailEmbury = Cocktail(cocktailName: "Honeymoon Cocktail(Embury)",
                                       glasswareType: .stemmedGlassware,
                                       garnish: nil,
                                       ice: nil,
                                       author: davidEmbury,
                                       spec: honeymoonCocktailSpecEmbury,
                                       tags: honeymoonCocktailTagsEmbury,
                                       variation: .honeymoon,
                                       collection: .originals)

var honeymoonCocktailSpecEmbury =  [OldCocktailIngredient(.juices(.lime), value: 0.5),
                                    OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.125),
                                    OldCocktailIngredient(.liqueurs(.benedictine), value: 0.125),
                                    OldCocktailIngredient(.brandies(.lairdsApplejack), value: 2)]

var honeymoonCocktailTagsEmbury = Tags( profiles: [.fruity, .citrusy, .dry, .tart],
                                        styles: [.daisy, .shaken, .sour])
