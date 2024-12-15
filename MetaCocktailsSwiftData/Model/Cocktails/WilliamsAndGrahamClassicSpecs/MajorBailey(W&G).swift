//
//  MajorBailey(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var majorBaileyWnG = Cocktail(cocktailName: "Major Bailey" + wAndGTitleTag,
                              glasswareType: .fizzGlass,
                              garnish: [.mintBouquet],
                              ice: .koldDraft,
                              author: williamsAndGraham,
                              spec: majorBaileySpecWnG,
                              buildOrder: majorBaileyBuildWnG,
                              tags: majorBaileyTagsWnG,
                              variation: .majorBailey,
                              collection: .williamsAndGraham)

let majorBaileySpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                OldCocktailIngredient(.juices(.lime), value: 0.5),
                                                OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                OldCocktailIngredient(.gins(.fordsGin), value: 2)]


let majorBaileyTagsWnG = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                              styles: [.sour, .shaken])

