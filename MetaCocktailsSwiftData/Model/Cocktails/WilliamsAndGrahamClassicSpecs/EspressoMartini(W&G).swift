//
//  EspressoMartini(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var espressoMartiniWnG = Cocktail(cocktailName: "Espresso Martini (W&G Version)",
                                  glasswareType: .martini,
                                  garnish: [.coffeeBeans],
                                  author: williamsAndGraham,
                                  spec: espressoMartiniSpecWnG,
                                  buildOrder: espressoMartiniBuildWnG,
                                  tags: espressoMartiniTagsWnG,
                                  variation: .espressoMartini,
                                  collection: .williamsAndGraham)

var espressoMartiniSpecWnG  = [OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25, prep: PrepBible.demSyrupPrep),
                               OldCocktailIngredient(.liqueurs(.borghetti), value: 0.5),
                               OldCocktailIngredient(.otherNonAlc(.coldBrew), value: 1.5),
                               OldCocktailIngredient(.vodkas(.roaringForkVodka), value: 1.5),
                               OldCocktailIngredient(.otherNonAlc(.angosturaCream), value: 1, prep: PrepBible.angoCream),]

var espressoMartiniTagsWnG = Tags(profiles: [.creamy, .light],
                                  styles: [.shaken])

var espressoMartiniBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add everything but the cream to a tin with ice and shake."),
                                                   Instruction(step: 2, method: "Strain into a chilled cocktail glass."),
                                                   Instruction(step: 3, method: "Float the Angostura cream and make a pretty design."),
                                                   Instruction(step: 4, method: "Garnish with 3 espresso beans.")])

