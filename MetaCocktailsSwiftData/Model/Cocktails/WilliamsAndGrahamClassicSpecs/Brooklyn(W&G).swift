//
//  Brooklyn(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var brooklynWnG = Cocktail(cocktailName: "Brooklyn Cocktail (Williams and Graham spec.)",
                           glasswareType: .stemmedGlassware,
                           garnish: [.lemonExpression],
                           author:Author(person: "Jacob A. Grohusko", place: "Jack's Manual", year: "New York, 1908"),
                           spec: brooklynSpec,
                           tags: brooklynTags)

var brooklynWnGSpec     =  [CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                            CocktailIngredient(.amari(.chinaChina), value: 0.25),
                            CocktailIngredient(.fortifiedWines(.dolinDry), value: 1),
                            CocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

