//
//  Tipperary(1916).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tipperary = Cocktail(cocktailName: "Tipperary(1916 Version)",
                         glasswareType: .stemmedGlassware,
                         garnish: nil,
                         author: hugoEnsslin,
                         spec: tipperarySpec,
                         tags: tipperaryTags,
                         variation: .tipperary)

var tipperarySpec     =  [CocktailIngredient(.whiskies(.bushmills), value: 1),
                          CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                          CocktailIngredient(.liqueurs(.greenChartreuse), value: 1)]

var tipperaryTags     = Tags(profiles: [.spiritForward, .bittersweet, .herbal],
                             styles: [ .stirred])
                        
