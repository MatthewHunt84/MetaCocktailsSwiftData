//
//  Bijou(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bijouWnG = Cocktail(cocktailName: "Bijou (Williams & Graham spec.)",
                        glasswareType: .stemmedGlassware,
                        garnish: [.orangePeel],
                        author:Author(person: AuthorNames.harryJohnson.rawValue, place: AuthorPlaces.harryJohnsonManual.rawValue, year: "1900"),
                        spec: bijouWnGSpec,
                        tags: bijouTags)

var bijouWnGSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                         CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                         CocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                         CocktailIngredient(.gins(.fordsGin), value: 1)]
