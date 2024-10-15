//
//  ChocolateCocktail(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var chocolateCocktail  = Cocktail(cocktailName: "Chocolate Cocktail No. 2",
                                  glasswareType: .singleOld,
                                  author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                                  spec: chocolateCocktailSpec,
                                  buildOrder: eggWhiteInstructionsNoBitters,
                                  tags: chocolateCocktailTags,
                                  variation: .chocolateCocktail,
                                  collection: .originals,
                                  historicSpec: .chocolateCocktail)

var chocolateCocktailSpec  = [OldCocktailIngredient(.otherNonAlc(.eggYolk), value: 1, unit: .whole),
                              OldCocktailIngredient(.otherNonAlc(.crushedChocolate), value: 1, unit: .teaspoon),
                              OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.5),
                              OldCocktailIngredient(.fortifiedWines(.tawnyPort) , value: 1.5)]

var chocolateCocktailTags   = Tags(profiles: [.sweet, .rich],
                                   styles: [.shaken, .flip])

