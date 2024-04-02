//
//  Mojito(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mojitoWnG = Cocktail(cocktailName: "Mojito (W&G Version)",
                         imageAsset: nil,
                         glasswareType: .collins,
                         garnish: [.mintBouquet],
                         ice: .koldDraft,
                         author: williamsAndGraham,
                         spec: mojitoSpec,
                         buildOrder: mojitoBuild,
                         tags: mojitoTags,
                         variation: .mojito,
                         collection: .williamsAndGraham)

let mojitoSpecWnG: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                           CocktailIngredient(.juices(.lime), value: 0.75),
                                           CocktailIngredient(.syrups(.simple), value: 0.75),
                                           CocktailIngredient(.rums(.rumWhite), value: 2),
                                           CocktailIngredient(.soda(.sparklingWater), value: 2)]


