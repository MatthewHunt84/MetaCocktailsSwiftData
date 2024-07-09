//
//  Tipperary(1916).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tipperary = Cocktail(cocktailName: "Tipperary",
                         glasswareType: .stemmedGlassware,
                         garnish: nil,
                         author: hugoEnsslin,
                         spec: tipperarySpec,
                         tags: tipperaryTags,
                         variation: .tipperary,
                         collection: .originals,
                         titleCocktail: true)

var tipperarySpec     =  [OldCocktailIngredient(.whiskies(.bushmills), value: 1),
                          OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                          OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 1)]

var tipperaryTags     = Tags(profiles: [.spiritForward, .bittersweet, .herbal],
                             styles: [ .stirred])
                        
