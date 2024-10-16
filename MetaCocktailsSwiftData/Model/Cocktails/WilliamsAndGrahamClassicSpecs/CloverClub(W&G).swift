//
//  CloverClub(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var cloverClubWnG = Cocktail(cocktailName: "Clover Club" + wAndGTitleTag,
                             glasswareType: .stemmedGlassware,
                             garnish: [.raspberry],
                             author: williamsAndGraham,
                             spec: cloverClubSpecWnG,
                             buildOrder: cloverClubBuildWnG,
                             notes: cloverClubNotes,
                             tags: cloverClubTags,
                             variation: .cloverClub,
                             collection: .williamsAndGraham)

var cloverClubSpecWnG  = [OldCocktailIngredient(.fruit(.raspberries), value: 6, unit: .whole),
                          OldCocktailIngredient(.juices(.lemon), value: 0.5),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                          OldCocktailIngredient(.gins(.fordsGin), value: 1.5),
                          OldCocktailIngredient(.bitters(.peychauds), value: 6, unit: .drops)]

var cloverClubBuildWnG = Build(instructions: [Instruction(step: 1, method: "Muddle the raspberries then add the rest of the ingredients, except for the bitters, and dry shake."),
                                              Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                              Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass."),
                                              Instruction(step: 4, method: "Drop bitters on top to make a design. Don't add too much bitters here."),
                                              Instruction(step: 5, method: "Garnish with a skewered raspberry.")])


