//
//  KentuckyMaid(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var kentuckyMaidWnG = Cocktail(cocktailName: "Kentucky Maid" + wAndGTitleTag,
                               imageAsset: nil,
                               glasswareType: .doubleOld,
                               garnish: [.mintSprig],
                               ice: .koldDraft,
                               author: williamsAndGraham,
                               spec: kentuckyMaidSpecWnG,
                               tags: kentuckyMaidTags,
                               variation: .kentuckyMaid,
                               collection: .williamsAndGraham)

let kentuckyMaidSpecWnG : [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                                  OldCocktailIngredient(.juices(.lime), value: 1),
                                                  OldCocktailIngredient(.syrups(.cucumberSyrup), value: 0.75, prep: PrepBible.cucumberSyrup),
                                                  OldCocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 2)]
