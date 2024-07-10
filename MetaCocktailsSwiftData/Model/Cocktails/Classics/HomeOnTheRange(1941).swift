//
//  HomeOnTheRange(1941).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/27/24.
//

import Foundation


var homeOnTheRange = Cocktail(cocktailName: "Home on the Range",
                              glasswareType: .stemmedGlassware,
                              garnish: [.lemonPeel, .orangePeel],
                              author:Author(person: "Crosby Gaige",  place: AuthorPlaces.crosbyGaigeCocktailGuide.rawValue , year: "1941"),
                              spec: homeOnTheRangeSpec,
                              tags: homeOnTheRangeTags,
                              variation: .homeOnTheRange,
                              collection: .originals,
                              titleCocktail: true)

var homeOnTheRangeSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                               OldCocktailIngredient(.liqueurs(.cointreau), value: 3, unit: .dashes),
                               OldCocktailIngredient(.fortifiedWines(.dubonnet), value: 1.5),
                               OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5)]

var homeOnTheRangeTags     = Tags(profiles: [.spiritForward, .bittersweet, .fruity],
                                  styles: [.manhattan, .stirred])

