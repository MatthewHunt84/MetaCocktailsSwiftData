//
//  DiamondBack.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var diamondBack = Cocktail(cocktailName: "Diamondback",
                              glasswareType: .stemmedGlassware,
                              author:Author(person: "Ted Saucier", place: "Diamondback Lounge, Lord Baltimore Hotel", year: "1951"),
                              spec: diamondBackSpec,
                              tags: diamondBackTags)

var diamondBackSpec     =  [CocktailIngredient(.liqueurs(.yellowChartreuse), value: 1),
                               CocktailIngredient(.brandies(.lairdsApplejack), value: 1),
                               CocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]

var diamondBackTags     = Tags(profiles: [.spiritForward, .rich],
                                  styles: [.martini, .stirred])

