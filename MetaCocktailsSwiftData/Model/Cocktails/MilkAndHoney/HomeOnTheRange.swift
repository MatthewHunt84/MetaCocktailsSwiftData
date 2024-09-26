//
//  HomeOnTheRange.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/27/24.
//

import Foundation

var homeOnTheRangeMnH = Cocktail(cocktailName: "Home on the Range" + mAndHVersionTag,
                                 glasswareType: .doubleOld,
                                 garnish: [.lemonPeel, .orangePeel],
                                 ice: .bigRock,
                                 author:Author(person: AuthorNames.michaelMadrusan.rawValue,
                                               place: AuthorPlaces.milkAndHoney.rawValue ,
                                               year: "Early 2000s"),
                                 spec: homeOnTheRangeSpecMnH,
                                 tags: homeOnTheRangeTagsMnH,
                                 variation: .homeOnTheRange,
                                 collection: .milkAndHoney)

var homeOnTheRangeSpecMnH     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                                  OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.25),
                                  OldCocktailIngredient(.liqueurs(.cointreau), value: 0.25),
                                  OldCocktailIngredient(.whiskies(.bourbonAny), value: 2)]

var homeOnTheRangeTagsMnH     = Tags(flavors: [.orange, .lemon],
                                     profiles: [.spiritForward, .bittersweet, .fruity],
                                     styles: [.manhattan, .stirred])

