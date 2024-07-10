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
                           tags: sagedOracleTags,
                           collection: .williamsAndGraham)

let sagedOracleSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.sage), value: 5, unit: .gentlyMuddled),
                                             OldCocktailIngredient(.syrups(.simple), value: 0.75),
                                             OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                             OldCocktailIngredient(.juices(.grapefruit), value: 0.75),
                                             OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                             OldCocktailIngredient(.gins(.juniperJones), value: 2)]


let sagedOracleTags = Tags(profiles: [.herbal, .refreshing, .floral, .light],
                           styles: [.sour, .shaken])
