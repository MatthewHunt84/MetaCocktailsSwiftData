//
//  BrandyAlexander(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/18/24.
//

import Foundation

let brandyAlexanderWnG = Cocktail(cocktailName: "Brandy Alexander (W&G Version)",
                                  glasswareType: .coupe,
                                  garnish: [.nutmeg],
                                  author: williamsAndGraham,
                                  spec: brandyAlexanderSpecWnG,
                                  tags: brandyAlexanderTagsWnG,
                                  variation: .alexander,
                                  collection: .williamsAndGraham)

var brandyAlexanderSpecWnG: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                                                       OldCocktailIngredient(.liqueurs(.cremeDeCacao), value:1),
                                                       OldCocktailIngredient(.brandies(.pFAmber), value: 1)]

var brandyAlexanderTagsWnG = Tags(flavors: [.nutmeg],
                                  profiles: [.sweet, .rich],
                                  styles: [.shaken])

