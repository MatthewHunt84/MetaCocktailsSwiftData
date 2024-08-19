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
                                  tags: chocolateCocktailTags,
                                  collection: .originals)

var chocolateCocktailSpec  = [OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1),
                              OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                              OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 1),
                              OldCocktailIngredient(.fortifiedWines(.sandemanPort) , value: 1)]

var chocolateCocktailTags   = Tags(profiles: [.sweet, .rich],
                                   styles: [.shaken, .flip])

