//
//  SherryCobbler.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sherryCobbler = Cocktail(cocktailName: "Sherry Cobbler",
                             glasswareType: .collins,
                             garnish: [.seasonalBerries, .mintSprig],
                             ice: .pebbleIce,
                             spec: sherryCobblerSpec,
                             buildOrder: sherryCobblerBuild,
                             notes: sherryCobblerNotes,
                             tags: sherryCobblerTags,
                             variation: .sherryCobbler,
                             titleCocktail: true)

let sherryCobblerSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.lemonRibbon), value: 1, unit: .whole),
                                                  OldCocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                                  OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                                  OldCocktailIngredient(.fortifiedWines(.lustauAmontillado), value: 3)]



let sherryCobblerTags = Tags(flavors: [.mint],
                             profiles: [.refreshing, .fruity, .restorative],
                             styles: [.sour, .shaken])
