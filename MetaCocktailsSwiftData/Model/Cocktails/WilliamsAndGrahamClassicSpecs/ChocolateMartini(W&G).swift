//
//  ChocolateMartini(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var chocolateMartiniWnG = Cocktail(cocktailName: "Chocolate Martini (W&G Version)",
                                   imageAsset: nil,
                                   glasswareType: .martini,
                                   garnish: [.chocolateChips],
                                   author: williamsAndGraham,
                                   spec: chocolateMatiniSpec,
                                   tags: chocolateMatiniTags,
                                   variation: .chocolateMartini,
                                   collection: .williamsAndGraham)

let chocolateMatiniSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.saline), value: 2, unit: .drops),
                                                 OldCocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                                                 OldCocktailIngredient(.otherNonAlc(.cocoaPowder), value: 1, unit: .barSpoon),
                                                    OldCocktailIngredient(.syrups(.vanilla), value: 0.25, prep: PrepBible.vanillaSyrup),
                                                 OldCocktailIngredient(.otherNonAlc(.cream), value: 0.5),
                                                 OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                                 OldCocktailIngredient(.amari(.averna), value: 0.5),
                                                 OldCocktailIngredient(.vodkas(.roaringForkVodka), value: 1)]


let chocolateMatiniTags = Tags(profiles: [.sweet, .rich],
                               styles: [.shaken])

