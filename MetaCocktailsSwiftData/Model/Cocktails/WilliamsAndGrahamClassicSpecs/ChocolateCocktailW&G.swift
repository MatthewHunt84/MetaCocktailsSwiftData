//
//  ChocolateCocktailW&G.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var chocolateCocktailWnG  = Cocktail(cocktailName: "Chocolate Cocktail" + wAndGTitleTag,
                                     glasswareType: .snifter,
                                     garnish: [.cocoaPowder],
                                     author: williamsAndGraham,
                                     spec: chocolateCocktailSpecWnG,
                                     buildOrder: eggWhiteInstructionsNoBitters,
                                     tags: chocolateCocktailTagsWnG,
                                     variation: .chocolateCocktail)

var chocolateCocktailSpecWnG  = [OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1),
                                 OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                 OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 1),
                                 OldCocktailIngredient(.fortifiedWines(.sandemanPort) , value: 1)]

var chocolateCocktailTagsWnG   = Tags(profiles: [.sweet, .rich],
                                      styles: [.shaken, .flip])

