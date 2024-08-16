//
//  Tipperary(Dead Rabbit Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tipperaryDR = Cocktail(cocktailName: "Tipperary(Dead Rabbit)",
                           glasswareType: .stemmedGlassware,
                           garnish: [.orangePeel],
                           author: Author(person: "Gary McGarry", place: "The Dead Rabbit, New York", year: "2020"),
                           spec: tipperarySpecDR,
                           tags: tipperaryTagsDR,
                           variation: .tipperary)

var tipperarySpecDR     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2),
                            OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                            OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                            OldCocktailIngredient(.whiskies(.irishWhiskeyAny), value: 1.5)]

var tipperaryTagsDR     = Tags(flavors: [.orange],
                               profiles: [.spiritForward, .bittersweet, .herbal],
                               styles: [.manhattan, .stirred])

