//
//  Greenpoint(W&G.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var greenpointWnG = Cocktail(cocktailName: "Greenpoint(W&G Version)",
                             glasswareType: .stemmedGlassware,
                             garnish: [.orangePeel],
                             author:williamsAndGraham,
                             spec: greenpointSpecWnG,
                             tags: greenpointTagsWnG,
                             variation: .greenpoint,
                             collection: .williamsAndGraham)

var greenpointSpecWnG     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                              CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                              CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                              CocktailIngredient(.fortifiedWines(.puntEMes), value: 1),
                              CocktailIngredient(.whiskies(.rittenhouseRye), value: 2)]

var greenpointTagsWnG     = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                                 styles: [.manhattan, .stirred])

