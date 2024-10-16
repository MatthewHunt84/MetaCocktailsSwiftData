//
//  FairAndWarmer.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fairAndWarmer = Cocktail(cocktailName: "Fair and Warmer",
                             glasswareType: .coupe,
                             garnish: [.noGarnish],
                             author: harryCraddock,
                             spec: fairAndWarmerSpec,
                             tags: fairAndWarmerTags,
                             variation: .fairAndWarmer,
                             collection: .originals,
                             titleCocktail: true)

var fairAndWarmerSpec     =  [OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 2, unit: .dashes),
                              OldCocktailIngredient(.fortifiedWines(.dolinRouge), value: 1),
                              OldCocktailIngredient(.rums(.rumWhite), value: 2)]

var fairAndWarmerTags     = Tags(profiles: [.spiritForward, .fruity],
                                 styles: [.martini, .stirred])

