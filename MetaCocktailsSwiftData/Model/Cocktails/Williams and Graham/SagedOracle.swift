//
//  SagedOracle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var sagedOracle = Cocktail(cocktailName: "Saged Oracle",
                           imageAsset: nil,
                           glasswareType: .collins,
                           garnish: [.rosemarySprig],
                           ice: .pebbleIce,
                           author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                         place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                           spec: sagedOracleSpec,
                           tags: sagedOracleTags)

let sagedOracleSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.sage), value: 5, unit: .gentlyMuddled),
                                             CocktailIngredient(.syrups(.simple), value: 0.75),
                                             CocktailIngredient(.juices(.lemon), value: 0.5),
                                             CocktailIngredient(.juices(.grapefruit), value: 0.75),
                                             CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                             CocktailIngredient(.gins(.juniperJones), value: 2, unit: .dashes)]


let sagedOracleTags = Tags(profiles: [.herbal, .refreshing, .floral, .light],
                           styles: [.sour, .shaken])
