//
//  TomCollins(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tomCollinsWnG  = Cocktail(cocktailName: "Tom Collins" + wAndGTitleTag,
                              glasswareType: .collins,
                              garnish: [.maraschinoCherry, .halfOrangeWheel],
                              ice: .koldDraft,
                              author: williamsAndGraham,
                              spec: tomCollinsWnGSpec,
                              buildOrder: tomCollinsWnGBuild,
                              tags: tomCollinsWnGTags,
                              variation: .tomCollins,
                              collection: .williamsAndGraham)

var tomCollinsWnGSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.gins(.fordsGin), value: 2),
                          OldCocktailIngredient(.soda(.sodaWater) , value: 2)]

var tomCollinsWnGBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                               Instruction(step: 2, method: "strain over cracked ice and top with soda"),
                                               Instruction(step: 3, method: "Give a gentle stir")])

var tomCollinsWnGTags   = Tags(flavors: [.lemon],
                               profiles: [.citrusy, .floral, .effervescent, .light],
                               styles: [.collins, .shaken, .fizz])

