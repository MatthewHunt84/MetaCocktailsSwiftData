//
//  HarveyWallbanger(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var harveyWallbangerWnG = Cocktail(cocktailName: "Harvey Wallbanger(WnG Version)",
                                   glasswareType: .collins,
                                   garnish: [.orangeFlag],
                                   ice: .koldDraft,
                                   author: williamsAndGraham,
                                   spec: harveyWallbangerSpecWnG,
                                   buildOrder: harveyWallbangerWGBuild,
                                   tags: harveyWallbangerTagsWnG,
                                   variation: .harveyWallbanger,
                                   collection: .williamsAndGraham)

var harveyWallbangerSpecWnG    =  [CocktailIngredient(.liqueurs(.galliano), value: 0.5),
                                   CocktailIngredient(.juices(.orange), value: 2),
                                   CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var harveyWallbangerTagsWnG     = Tags(profiles: [.fruity, .sweet, .gross],
                                       styles: [.sour, .shaken])

var harveyWallbangerWGBuild = Build(instructions: [Instruction(step: 1, method: "Build in glass, float the Galliano.")])
