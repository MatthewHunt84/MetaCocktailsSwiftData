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

var waterLilySpec     =  [OldCocktailIngredient(.syrups(.violetteSyrup), value: 0.75, prep: PrepBible.violetteSyrup),
                          OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                          OldCocktailIngredient(.gins(.ginAny), value: 0.75)]

var waterLilyTags     = Tags(profiles: [.light, .floral, .fruity, .citrusy],
                             styles: [.sour, .shaken])
