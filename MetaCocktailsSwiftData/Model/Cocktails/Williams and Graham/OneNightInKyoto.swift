//
//  OneNightInKyoto.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var oneNightInKyoto  =  Cocktail(cocktailName: "One Night In Kyoto",
                                 glasswareType: .doubleOld,
                                 garnish: [.lemonPeel],
                                 ice: .bigRock,
                                 author:Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                                 spec: oneNightInKyotoSpec,
                                 buildOrder: nil,
                                 tags: oneNightInKyotoTags)

var oneNightInKyotoSpec = [CocktailIngredient(.bitters(.bitterTruthJTDecanter), value: 2, unit: .dashes),
                           CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                           CocktailIngredient(.fortifiedWines(.cocchiBaroloChinato), value: 2),
                           CocktailIngredient(.whiskies(.hibikiHarmony), value: 2)]

var oneNightInKyotoTags = Tags(profiles: [.rich, .herbal, .punchy, .sophisticated],
                               styles: [.manhattan, .stirred])
