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
                           tags: diamondBackTags,
                           collection: .originals)

var diamondBackSpec     =  [OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 1),
                            OldCocktailIngredient(.brandies(.lairdsApplejack), value: 1),
                            OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 1)]

var diamondBackTags     = Tags(profiles: [.spiritForward, .rich],
                               styles: [.martini, .stirred])

