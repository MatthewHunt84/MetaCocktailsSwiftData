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


let oldCubanWnGBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients, except for the sparkling wine, in a tin. Use Kold draft of Hoshizake cubes and the mint will the muddled while you're shaking."),
                                        Instruction(step: 2, method: "Double strain the shaken cocktail over the ice then top with Prosecco."),
                                        Instruction(step: 3, method: "Garnish with a mint sprig. Serve with a straw.")])

