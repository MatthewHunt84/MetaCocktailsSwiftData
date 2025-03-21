//
//  Bijou(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bijouWnG = Cocktail(cocktailName: "Bijou" + wAndGTitleTag,
                        glasswareType: .stemmedGlassware,
                        garnish: [.orangePeel],
                        author: williamsAndGraham,
                        spec: bijouWnGSpec,
                        tags: bijouTagsWnG,
                        variation: .bijou,
                        collection: .williamsAndGraham)

var bijouWnGSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                         OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                         OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                         OldCocktailIngredient(.gins(.fordsGin), value: 1)]

var bijouTagsWnG     = Tags(flavors: [.orange],
                            profiles: [.spiritForward, .complex,  .rich],
                            styles: [.martini, .stirred])
