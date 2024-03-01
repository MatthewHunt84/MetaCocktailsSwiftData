//
//  MaiTai(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var maiTaiWnG  = Cocktail(cocktailName: "Mai Tai(W&G Version)",
                          glasswareType: .doubleOld,
                          garnish: [.mintSprig, .limeWheel],
                          ice: .pebbleIce,
                          author: williamsAndGraham,
                          spec: maiTaiSpecWnG,
                          tags: maiTaiTagsWnG,
                          variation: .maiTai,
                          collection: .williamsAndGraham)

var maiTaiSpecWnG    = [CocktailIngredient(.juices(.lime), value: 1),
                        CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                        CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.75),
                        CocktailIngredient(.rums(.smithAndCross), value: 0.5),
                        CocktailIngredient(.rums(.plantationBarbados), value: 1.5)]

var maiTaiTagsWnG     = Tags(profiles: [.fruity, .refreshing, .citrusy],
                             styles: [.sour, .shaken])


