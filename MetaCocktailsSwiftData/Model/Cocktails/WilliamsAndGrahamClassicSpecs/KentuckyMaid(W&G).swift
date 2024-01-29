//
//  KentuckyMaid(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kentuckyMaidWnG = Cocktail(cocktailName: "Kentucky Maid(W&G)",
                               imageAsset: nil,
                               glasswareType: .doubleOld,
                               garnish: [.mintSprig],
                               ice: .koldDraft,
                               author: williamsAndGraham,
                               spec: kentuckyMaidSpecWnG,
                               tags: kentuckyMaidTags)

let kentuckyMaidSpecWnG : [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                  CocktailIngredient(.juices(.lime), value: 1),
                                                  CocktailIngredient(.syrups(.cucumberSyrup), value: 0.75),
                                                  CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2)]
