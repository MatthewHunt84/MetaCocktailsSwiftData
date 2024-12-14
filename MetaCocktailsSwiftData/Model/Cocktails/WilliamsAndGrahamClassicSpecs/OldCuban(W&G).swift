//
//  OldCuban(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldCubanWnG = Cocktail(cocktailName: "Old Cuban" + wAndGTitleTag,
                           glasswareType: .collins,
                           garnish: [.mintSprig],
                           ice: .crackedIce,
                           author: williamsAndGraham,
                           spec: oldCubanSpecWnG,
                           buildOrder: oldCubanWnGBuild,
                           tags: oldCubanTags,
                           variation: .oldCuban,
                           collection: .williamsAndGraham)

let oldCubanSpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                             OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                             OldCocktailIngredient(.juices(.lime), value: 0.75),
                                             OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                                             OldCocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                                             OldCocktailIngredient(.wines(.prosecco), value: 2)]


