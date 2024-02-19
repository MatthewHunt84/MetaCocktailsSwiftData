//
//  SherryCobbler.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sherryCobbler = Cocktail(cocktailName: "Sherry Cobbler(1800s version)",
                             imageAsset: nil,
                             glasswareType: .collins,
                             garnish: [.seasonalBerries, .mintSprig],
                             ice: .pebbleIce,
                             spec: sherryCobblerSpec,
                             buildOrder: sherryCobblerBuild,
                             tags: sherryCobblerTags,
                             variation: .sherryCobbler)

let sherryCobblerSpec: [CocktailIngredient] = [CocktailIngredient(.fruit(.lemonRibbon), value: 1, unit: .whole),
                                               CocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                                               CocktailIngredient(.juices(.lemon), value: 0.25),
                                               CocktailIngredient(.syrups(.richSimple), value: 0.5),
                                               CocktailIngredient(.fortifiedWines(.lustauAmontillado), value: 3)]

let sherryCobblerBuild = Build(instructions: [Instruction(step: 1, method: "Muddle 2 orange moons and then add your lemon peel."),
                                              Instruction(step: 2, method: "Add the rest of your ingredients and shake with cubed ice."),
                                              Instruction(step: 3, method: "Double strain over pebble ice and then garnish."),
                                              Instruction(step: 3, method: "NOTE: This cocktail is one of those 'too old to tell' cocktails, so it's up to interpretation. It used to be a muddle stuff and dirty dump situation.")])

let sherryCobblerTags = Tags(profiles: [.refreshing, .fruity, .restorative],
                             styles: [.sour, .shaken])

