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

var sugarplumSpec     =  [CocktailIngredient(.juices(.grapefruit), value: 1),
                          CocktailIngredient(.syrups(.grenadine), value: 0.5),
                          CocktailIngredient(.gins(.ginAny), value: 2)]

var sugarplumTags     = Tags(profiles: [.fruity, .refreshing],
                             styles: [.sour, .shaken])

