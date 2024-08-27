//
//  Tipperary (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tipperaryWnG = Cocktail(cocktailName: "Tipperary (W&G Version)",
                            glasswareType: .martini,
                            garnish: [.orangeExpress, .maraschinoCherry],
                            author: williamsAndGraham,
                            spec: tipperarySpecWnG,
                            tags: tipperaryTagsWnG,
                            variation: .tipperary,
                            collection: .williamsAndGraham)

var tipperarySpecWnG     =  [OldCocktailIngredient(.fortifiedWines(.puntEMes), value: 0.5),
                             OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                             OldCocktailIngredient(.whiskies(.bushmills12), value: 2)]

var tipperaryTagsWnG     = Tags(flavors: [.orange],
                                profiles: [.spiritForward, .bittersweet, .herbal],
                                styles: [.manhattan, .stirred])

