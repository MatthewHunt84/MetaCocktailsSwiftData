//
//  FairAndWarmer.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fairAndWarmer = Cocktail(cocktailName: "Fair & Warmer(1930)",
                             glasswareType: .coupe,
                             garnish: [.noGarnish],
                             author: harryCraddock,
                             spec: fairAndWarmerSpec,
                             tags: fairAndWarmerTags,
                             variation: .fairAndWarmer)

var fairAndWarmerSpec     =  [CocktailIngredient(.liqueurs(.orangeCuracao), value: 2, unit: .dashes),
                              CocktailIngredient(.fortifiedWines(.dolinRouge), value: 1),
                              CocktailIngredient(.rums(.rumWhite), value: 2)]

var fairAndWarmerTags     = Tags(profiles: [.spiritForward, .fruity],
                                 styles: [.martini, .stirred])

