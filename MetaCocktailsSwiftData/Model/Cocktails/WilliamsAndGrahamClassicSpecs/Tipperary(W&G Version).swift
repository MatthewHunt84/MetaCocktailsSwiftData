//
//  Tipperary(W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tipperaryWnG = Cocktail(cocktailName: "Tipperary(W&G Version)",
                            glasswareType: .martini,
                            garnish: [.orangeExpress, .maraschinoCherry],
                            author: williamsAndGraham,
                            spec: tipperarySpecWnG,
                            tags: tipperaryTagsWnG)

var tipperarySpecWnG     =  [CocktailIngredient(.fortifiedWines(.puntEMes), value: 0.5),
                             CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                             CocktailIngredient(.whiskies(.bushmills12), value: 2)]

var tipperaryTagsWnG     = Tags(profiles: [.spiritForward, .bittersweet, .sophisticated, .herbal],
                                styles: [.manhattan, .stirred])

