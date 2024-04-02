//
//  CloverClub(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var cloverClubWnG = Cocktail(cocktailName: "Clover Club (W&G Version)",
                             glasswareType: .stemmedGlassware,
                             garnish: [.raspberry],
                             author: williamsAndGraham,
                             spec: cloverClubSpecWnG,
                             buildOrder: cloverClubBuildWnG,
                             tags: cloverClubTags,
                             variation: .cloverClub,
                             collection: .williamsAndGraham)

var cloverClubSpecWnG  = [CocktailIngredient(.fruit(.raspberries), value: 6, unit: .whole),
                          CocktailIngredient(.juices(.lemon), value: 0.5),
                          CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          CocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                          CocktailIngredient(.gins(.fordsGin), value: 1.5),
                          CocktailIngredient(.bitters(.peychauds), value: 6, unit: .drops)]

var cloverClubBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle the raspberries then add the rest of the ingredients, except for the bitters, and dry shake."),
                                              Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                              Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                              Instruction(step: 4, method: "Drop bitters on top to make a design. Don't add too much bitters here."),
                                              Instruction(step: 5, method: "Garnish with a skewered raspberry.")])


