//
//  EspressoMartini(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var espressoMartiniWnG = Cocktail(cocktailName: "Espresso Martini (Williams & Graham Spec.)",
                               glasswareType: .martini,
                               garnish: [.coffeeBeans],
                               spec: espressoMartiniSpecWnG,
                               buildOrder: espressoMartiniBuildWnG,
                               tags: espressoMartiniTagsWnG)

var espressoMartiniSpecWnG  = [CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.25),
                            CocktailIngredient(.liqueurs(.borghetti), value: 0.5),
                            CocktailIngredient(.otherNonAlc(.coldBrew), value: 1.5),
                            CocktailIngredient(.vodkas(.roaringForkVodka), value: 1.5),
                            CocktailIngredient(.otherNonAlc(.espressoCream), value: 1, unit: .float),]

var espressoMartiniTagsWnG = Tags(profiles: [.creamy, .light],
                               styles: [.shaken])

var espressoMartiniBuildWnG = Build(instructions: [Instruction(step: 1, method: "Add everything but the cream to a tin and shake."),
                                                Instruction(step: 2, method: "Strain into a chilled cocktail glass."),
                                                Instruction(step: 3, method: "Float the lightly whipped cream and make a pretty design."),
                                                Instruction(step: 4, method: "Garnish with 3 espresso beans.")])

