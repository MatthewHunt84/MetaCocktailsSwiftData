//
//  HouseBobbyBurns.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var houseBobbyBurns = Cocktail(cocktailName: "Bobby Burns" + houseTag,
                               glasswareType: .nickAndNora,
                               garnish: [.lemonPeel],
                               spec: houseBobbyBurnsSpec,
                               tags: houseBobbyBurnsTags,
                               variation: .bobbyBurns,
                               collection: .house)

var houseBobbyBurnsSpec     =  [OldCocktailIngredient(.liqueurs(.benedictine), value: 2, unit: .barSpoon),
                                OldCocktailIngredient(.fortifiedWines(.dolinRouge), value: 1),
                                OldCocktailIngredient(.whiskies(.scotchSpeyside), value: 2)]

var houseBobbyBurnsTags     = Tags(flavors: [.lemon],
                                   profiles: [.spiritForward,  .rich],
                                   styles: [.manhattan, .stirred])
