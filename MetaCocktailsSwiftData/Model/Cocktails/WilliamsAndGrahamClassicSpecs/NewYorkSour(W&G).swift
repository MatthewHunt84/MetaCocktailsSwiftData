//
//  NewYorkSour(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var NewYorkSourWnG = Cocktail(cocktailName: "New York Sour(W&G Version)",
                              glasswareType: .stemmedGlassware,
                              garnish: nil,
                              ice: nil,
                              author: williamsAndGraham,
                              spec: NewYorkSourSpecWnG,
                              buildOrder: NewYorkSourBuildWnG,
                              tags: NewYorkSourTagsWnG)

var NewYorkSourSpecWnG = [CocktailIngredient(.juices(.lemon), value: 0.75),
                          CocktailIngredient(.syrups(.simple), value: 0.75),
                          CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          CocktailIngredient(.whiskies(.fourRosesYellowLabel), value: 1.5),
                          CocktailIngredient(.wines(.dryRedWine), value: 0.5, unit: .float)]

var NewYorkSourTagsWnG = Tags(profiles: [.citrusy, .light, .refreshing, .silky],
                              styles: [.sour, .shaken])

var NewYorkSourBuildWnG = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the red wine, together in a tin and dry shake to emulsify."),
                                               Instruction(step: 2, method: "Then shake with ice being careful not to over dilute."),
                                               Instruction(step: 2, method: "carefully train into a chilled cocktail glass."),
                                               Instruction(step: 3, method: "Carefully float the red wine on top of the cocktail so that there's a clear separation between the wine and the rest of the cocktail.")])
