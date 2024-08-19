//
//  TiPunch(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tiPunchWnG = Cocktail(cocktailName: "Ti' Punch (W&G Version)",
                          glasswareType: .singleOld,
                          garnish: [.limeDisc],
                          ice: .koldDraft,
                          author: Author(place: "Somewhere in Martinique"),
                          spec: tiPunchSpecWnG,
                          notes: tiPunchNotesWnG,
                          tags: tiPunchTagsWnG,
                          variation: .tiPunch,
                          collection: .williamsAndGraham)

var tiPunchSpecWnG  =  [OldCocktailIngredient(.syrups(.simple), value: 1, unit: .barSpoon, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.rums(.clementBleue), value: 2)]

var tiPunchTagsWnG = Tags(flavors: [.lime],
                          profiles: [.sweet, .spiritForward, .funky],
                          styles: [.oldFashioned, .stirred])

var tiPunchNotesWnG = "Think of this like an Old Fashioned without the bitters."
