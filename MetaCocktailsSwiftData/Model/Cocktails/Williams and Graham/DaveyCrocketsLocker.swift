//
//  DaveyCrocketsLocker.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var daveyCrocketsLocker = Cocktail(cocktailName: "Davey Crocket's Locker",
                                   imageAsset: nil,
                                   glasswareType: .doubleOld,
                                   garnish: [.orangePeel],
                                   ice: .bigRock,
                                   author: justWnG,
                                   spec: daveyCrocketsLockerSpec,
                                   tags: daveyCrocketsLockerTags,
                                   collection: .williamsAndGraham)

let daveyCrocketsLockerSpec = [OldCocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .barSpoon),
                               OldCocktailIngredient(.fortifiedWines(.sandemanPort), value: 0.5),
                               OldCocktailIngredient(.amari(.amereNouvelle), value: 0.5),
                               OldCocktailIngredient(.amari(.averna), value: 0.5),
                               OldCocktailIngredient(.rums(.plantationJamaicaRum), value: 1.5)]


let daveyCrocketsLockerTags = Tags(profiles: [.punchy, .complex, .rich, .spiritForward],
                                   styles: [.manhattan, .stirred])



