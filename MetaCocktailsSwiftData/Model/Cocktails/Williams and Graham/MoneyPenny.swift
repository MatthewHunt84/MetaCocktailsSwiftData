//
//  MoneyPenny.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var moneyPenny = Cocktail(cocktailName: "Money Penny",
                          imageAsset: nil,
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          ice: nil,
                          author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                          spec: moneyPennySpec,
                          tags: moneyPennyTags,
                          collection: .williamsAndGraham)

let moneyPennySpec = [CocktailIngredient(.bitters(.hoppedGrapefruit), value: 3, unit: .drops),
                      CocktailIngredient(.liqueurs(.giffardElderflour), value: 0.25),
                      CocktailIngredient(.fortifiedWines(.tioPepe), value: 0.25),
                      CocktailIngredient(.gins(.hendricksOrbium), value: 1),
                      CocktailIngredient(.vodkas(.reyka), value: 1)]


let moneyPennyTags = Tags(profiles: [.fruity, .refreshing, .light],
                          styles: [.sour, .shaken])



