//
//  TiPunch(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tiPunchWnG = Cocktail(cocktailName: "Ti' Punch(W&G version)",
                          glasswareType: .singleOld,
                          garnish: [.limeDisc],
                          ice: .koldDraft,
                          author: Author(place: "Somewhere in Martinique"),
                          spec: tiPunchSpecWnG,
                          buildOrder: tiPunchBuildOrderWnG,
                          tags: tiPunchTagsWnG,
                          variation: .tiPunch)

var tiPunchSpecWnG  =  [CocktailIngredient(.syrups(.simple), value: 1, unit: .barSpoon),
                        CocktailIngredient(.rums(.clementBleue), value: 2)]

var tiPunchTagsWnG = Tags( profiles: [.sweet, .spiritForward, .funky],
                           styles: [.oldFashioned, .stirred])

var tiPunchBuildOrderWnG = Build(instructions: [Instruction(step: 1, method: "Think of this like an old-fashioned without the bitters")])
