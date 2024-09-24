//
//  Greenpoint(W&G.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var greenpointWnG = Cocktail(cocktailName: "Greenpoint" + wAndGTitleTag,
                             glasswareType: .stemmedGlassware,
                             garnish: [.orangePeel],
                             author:williamsAndGraham,
                             spec: greenpointSpecWnG,
                             tags: greenpointTagsWnG,
                             variation: .greenpoint,
                             collection: .williamsAndGraham)

var greenpointSpecWnG     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                              OldCocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                              OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                              OldCocktailIngredient(.fortifiedWines(.puntEMes), value: 1),
                              OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 2)]

var greenpointTagsWnG     = Tags(flavors: [.orange],
                                 profiles: [.spiritForward, .rich, .complex, .bittersweet],
                                 styles: [.manhattan, .stirred])

