//
//  ChocolateCocktail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var chocolateCocktail  = Cocktail(cocktailName: "Chocolate Cocktail",
                                  glasswareType: .snifter,
                                  garnish: [.cocoaPowder],
                                  author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                                  spec: chocolateCocktailSpec,
                                  buildOrder: eggWhiteInstructionsNoBitters,
                                  tags: chocolateCocktailTags)

var chocolateCocktailSpec  = [CocktailIngredient(.otherNonAlc(.eggWhole), value: 1),
                              CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                              CocktailIngredient(.liqueurs(.yellowChartreuse), value: 1),
                              CocktailIngredient(.fortifiedWines(.sandemanPort) , value: 1)]

var chocolateCocktailTags   = Tags(profiles: [.sweet, .rich],
                                   styles: [.shaken, .flip])

