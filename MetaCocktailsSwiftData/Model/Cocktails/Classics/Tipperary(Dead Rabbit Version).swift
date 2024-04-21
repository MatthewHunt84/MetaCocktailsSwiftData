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
                           author: Author(person: AuthorNames.garyMcgary.rawValue, place: AuthorPlaces.deadRabbit.rawValue, year: "2020"),
                           spec: tipperarySpecDR,
                           tags: tipperaryTagsDR,
                           variation: .tipperary)

var tipperarySpecDR     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2),
                            CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                            CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                            CocktailIngredient(.whiskies(.irishWhiskeyAny), value: 1.5)]

var tipperaryTagsDR     = Tags(profiles: [.spiritForward, .bittersweet, .herbal],
                               styles: [.manhattan, .stirred])

