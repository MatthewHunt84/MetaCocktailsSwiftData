//
//  HomeOnTheRange(1941).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/27/24.
//

import Foundation


var homeOnTheRange = Cocktail(cocktailName: "Home on the Range(1941)",
                              glasswareType: .stemmedGlassware,
                              garnish: [.lemonPeel, .orangePeel],
                              author:Author(person: "Crosby Gaige",  place: AuthorPlaces.crosbyGaigeCocktailGuide.rawValue , year: "1941"),
                              spec: homeOnTheRangeSpec,
                              tags: homeOnTheRangeTags)

var homeOnTheRangeSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                               CocktailIngredient(.liqueurs(.cointreau), value: 3, unit: .dashes),
                               CocktailIngredient(.fortifiedWines(.dubonnet), value: 1.5),
                               CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5)]

var homeOnTheRangeTags     = Tags(profiles: [.spiritForward, .bittersweet, .fruity],
                                  styles: [.manhattan, .stirred])

