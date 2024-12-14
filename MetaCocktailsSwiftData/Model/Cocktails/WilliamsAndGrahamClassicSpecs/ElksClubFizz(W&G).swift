//
//  ElksClubFizz(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elksClubWnG = Cocktail(cocktailName: "Elk's Club Fizz",
                           glasswareType: .fizzGlass,
                           garnish: [.lemonExpression],
                           author: williamsAndGraham,
                           spec: elksClubSpecWnG,
                           buildOrder: elksClubBuildWnG,
                           tags: elksClubTags,
                           variation: .elksClubFizz,
                           variationName: "Elk's Own Cocktail",
                           collection: .williamsAndGraham)

var elksClubSpecWnG  = [OldCocktailIngredient(.soda(.sodaWater), value: 2),
                        OldCocktailIngredient(.juices(.lemon), value: 0.75),
                        OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                        OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                        OldCocktailIngredient(.fortifiedWines(.sandemanPort), value: 1),
                        OldCocktailIngredient(.whiskies(.jimBeamRye), value: 1)]




var elksClubTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                        styles: [.sour, .shaken])

