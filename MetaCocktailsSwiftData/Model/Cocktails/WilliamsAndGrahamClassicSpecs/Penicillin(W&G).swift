//
//  Penicillin(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var penicillinWnG = Cocktail(cocktailName: "Penicillin" + wAndGTitleTag,
                             glasswareType: Glassware.doubleOld,
                             garnish: [.candiedGinger],
                             ice: .bigRock,
                             author:Author(person: AuthorNames.samRoss.rawValue,
                                           place: AuthorPlaces.milkAndHoney.rawValue),
                             spec: penicillinSpecWnG,
                             buildOrder: penicillinBuildWnG,
                             tags: penicillinTagsWnG,
                             variation: .penicillin,
                             collection: .williamsAndGraham)

var penicillinSpecWnG = [OldCocktailIngredient(.juices(.lemon), value: 0.75, unit: .fluidOunces),
                         OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                         OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                         OldCocktailIngredient(.whiskies(.monkeyShoulder), value: 1.5),
                         OldCocktailIngredient(.whiskies(.laphroaig10), value: 0.25)]

var penicillinTagsWnG = Tags(flavors: [.lemon, .honey, .ginger, .peat],
                             profiles: [.citrusy, .smokey, .light, .complex],
                             styles: [.sour, .shaken])

var penicillinBuildWnG = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the Isla Scotch, together in a tin and shake with ice."),
                                              Instruction(step: 2, method: "Strain over ice."),
                                              Instruction(step: 3, method: "Float the peated Islay whisky on top of the cocktail"),
                                              Instruction(step: 4, method: "Garnish With a lemon wheel.")])
