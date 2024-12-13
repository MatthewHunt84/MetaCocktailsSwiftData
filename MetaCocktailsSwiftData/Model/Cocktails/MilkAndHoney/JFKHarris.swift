//
//  JFKHarris.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var jFKHarris = Cocktail(cocktailName: "JFK Harris",
                         glasswareType: .doubleOld,
                         garnish: [.cucumberSlices],
                         ice: .bigRock ,
                         author:Author(person: AuthorNames.zacharyRubin.rawValue ,
                                       place: AuthorPlaces.milkAndHoney.rawValue ,
                                       year: "Early 2000s"),
                         spec: jFKHarrisSpec,
                         buildOrder: jFKHarrisBuild,
                         tags: jFKHarrisTags,
                         variation: nil ,
                         collection: .milkAndHoney)

var jFKHarrisSpec     =  [OldCocktailIngredient(.herbs(.mint), value: 11, unit: .gentlyMuddled),
                          OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                          OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.rums(.rumWhite), value: 2),
                          OldCocktailIngredient(.wines(.dryRedWine), value: 0.5)]

var jFKHarrisTags     = Tags(profiles: [.savory, .refreshing, .citrusy, .complex],
                             styles: [.sour, .shaken])


