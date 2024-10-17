//
//  Mojito(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var mojitoWnG = Cocktail(cocktailName: "Mojito" + wAndGTitleTag,
                         glasswareType: .collins,
                         garnish: [.mintBouquet],
                         ice: .koldDraft,
                         author: williamsAndGraham,
                         spec: mojitoSpecWnG,
                         buildOrder: mojitoBuild,
                         tags: mojitoTags,
                         variation: .mojito,
                         collection: .williamsAndGraham)

let mojitoSpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 6, unit: .gentlyMuddled),
                                              OldCocktailIngredient(.juices(.lime), value: 0.75),
                                              OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                              OldCocktailIngredient(.rums(.rumWhite), value: 2),
                                              OldCocktailIngredient(.soda(.sparklingWater), value: 2)]


