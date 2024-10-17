//
//  MoneyPenny.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var moneyPenny = Cocktail(cocktailName: "Money Penny",
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          ice: nil,
                          author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2019"),
                          spec: moneyPennySpec,
                          tags: moneyPennyTags,
                          collection: .williamsAndGraham)

let moneyPennySpec = [OldCocktailIngredient(.bitters(.hoppedGrapefruit), value: 3, unit: .drops),
                      OldCocktailIngredient(.liqueurs(.giffardElderflour), value: 0.25),
                      OldCocktailIngredient(.fortifiedWines(.tioPepe), value: 0.25),
                      OldCocktailIngredient(.gins(.hendricksOrbium), value: 1),
                      OldCocktailIngredient(.vodkas(.reyka), value: 1)]


let moneyPennyTags = Tags(flavors: [.lemon],
                          profiles: [.fruity, .refreshing, .light],
                          styles: [.sour, .shaken])



