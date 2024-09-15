//
//  HarveyWallbanger(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var harveyWallbangerWnG = Cocktail(cocktailName: "Harvey Wallbanger(WnG Version)",
                                   glasswareType: .collins,
                                   garnish: [.maraschinoCherry, .halfOrangeWheel],
                                   ice: .koldDraft,
                                   author: williamsAndGraham,
                                   spec: harveyWallbangerSpecWnG,
                                   notes: harveyWalbangerNotes,
                                   tags: harveyWallbangerTagsWnG,
                                   variation: .harveyWallbanger,
                                   collection: .williamsAndGraham)

var harveyWallbangerSpecWnG    =  [OldCocktailIngredient(.liqueurs(.galliano), value: 0.5),
                                   OldCocktailIngredient(.juices(.orange), value: 2),
                                   OldCocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var harveyWallbangerTagsWnG     = Tags(profiles: [.fruity, .sweet],
                                       styles: [.sour, .shaken])

