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
                                   collection: .williamsAndGraham)

let chocolateMatiniSpec: [CocktailIngredient] = [CocktailIngredient(.seasoning(.saline), value: 2, unit: .drops),
                                                 CocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                                                 CocktailIngredient(.otherNonAlc(.cocoaPowder), value: 1, unit: .barSpoon),
                                                 CocktailIngredient(.syrups(.vanilla), value: 0.25),
                                                 CocktailIngredient(.otherNonAlc(.cream), value: 0.5),
                                                 CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                                 CocktailIngredient(.amari(.averna), value: 0.5),
                                                 CocktailIngredient(.vodkas(.roaringForkVodka), value: 1)]


let chocolateMatiniTags = Tags(profiles: [.sweet, .rich],
                               styles: [.shaken])

