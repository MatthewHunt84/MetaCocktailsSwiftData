//
//  SugarPlum.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/13/24.
//

import Foundation

var sugarplum = Cocktail(cocktailName: "Sugarplum",
                         glasswareType: .coupe,
                         garnish: nil,
                         ice: nil ,
                         author:Author(person: AuthorNames.josephSchwartz.rawValue ,
                                       place: AuthorPlaces.milkAndHoney.rawValue ,
                                       year: "Early 2000s"),
                         spec: sugarplumSpec,
                         buildOrder: nil,
                         tags: sugarplumTags,
                         variation: nil ,
                         collection: .milkAndHoney)

var sugarplumSpec     =  [OldCocktailIngredient(.juices(.grapefruit), value: 1),
                          OldCocktailIngredient(.syrups(.grenadine), value: 0.5, prep: PrepBible.grenadine),
                          OldCocktailIngredient(.gins(.ginAny), value: 2)]

var sugarplumTags     = Tags(profiles: [.fruity, .refreshing],
                             styles: [.sour, .shaken])

