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
                                 tags: oneNightInKyotoTags,
                                 collection: .williamsAndGraham)

var oneNightInKyotoSpec = [OldCocktailIngredient(.bitters(.bitterTruthJTDecanter), value: 2, unit: .dashes),
                           OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                           OldCocktailIngredient(.fortifiedWines(.cocchiBaroloChinato), value: 2),
                           OldCocktailIngredient(.whiskies(.hibikiHarmony), value: 2)]

var oneNightInKyotoTags = Tags(profiles: [.rich, .herbal, .punchy],
                               styles: [.manhattan, .stirred])
