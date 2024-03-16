//
//  waterLily.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var waterLily = Cocktail(cocktailName: "Water Lily",
                         glasswareType: .coupe,
                         garnish: [.lemonPeel],
                         ice: nil,
                         author:Author(person: AuthorNames.richardBoccato.rawValue ,
                                       place: AuthorPlaces.milkAndHoney.rawValue ,
                                       year: "Early 2000s"),
                         spec: waterLilySpec,
                         buildOrder: nil,
                         tags: waterLilyTags,
                         collection: .milkAndHoney)

var waterLilySpec     =  [CocktailIngredient(.syrups(.violetteSyrup), value: 0.75, prep: PrepBible.violetteSyrup),
                          CocktailIngredient(.juices(.lemon), value: 0.75),
                          CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                          CocktailIngredient(.gins(.ginAny), value: 0.75)]

var waterLilyTags     = Tags(profiles: [.light, .floral, .fruity, .citrusy],
                             styles: [.sour, .shaken])
