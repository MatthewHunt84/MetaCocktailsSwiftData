//
//  MaiTai(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var maiTaiWnG  = Cocktail(cocktailName: "Mai Tai (W&G Version)",
                          glasswareType: .doubleOld,
                          garnish: [.mintSprig, .limeWheel],
                          ice: .pebbleIce,
                          author: williamsAndGraham,
                          spec: maiTaiSpecWnG,
                          tags: maiTaiTagsWnG,
                          variation: .maiTai,
                          collection: .williamsAndGraham)

var maiTaiSpecWnG    = [OldCocktailIngredient(.juices(.lime), value: 1),
                        OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                        OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.75),
                        OldCocktailIngredient(.rums(.smithAndCross), value: 0.5),
                        OldCocktailIngredient(.rums(.plantationBarbados), value: 1.5)]

var maiTaiTagsWnG     = Tags(flavors: [.mint],
                             profiles: [.fruity, .refreshing, .citrusy],
                             styles: [.sour, .shaken])


