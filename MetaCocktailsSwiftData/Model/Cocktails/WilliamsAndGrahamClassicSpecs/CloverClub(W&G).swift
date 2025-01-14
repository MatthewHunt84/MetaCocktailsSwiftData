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
                             notes: cloverClubNote,
                             tags: cloverClubTags,
                             variation: .cloverClub,
                             collection: .williamsAndGraham)

var cloverClubSpecWnG  = [OldCocktailIngredient(.fruit(.raspberries), value: 6, unit: .whole),
                          OldCocktailIngredient(.juices(.lemon), value: 0.5),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                          OldCocktailIngredient(.gins(.fordsGin), value: 1.5),
                          OldCocktailIngredient(.bitters(.peychauds), value: 6, unit: .drops)]




