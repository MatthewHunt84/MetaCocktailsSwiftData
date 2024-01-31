//
//  LemonDrop.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var lemonDrop = Cocktail(cocktailName: "Lemon Drop",
                         glasswareType: .sugarRimStemmed,
                         garnish: [.grapefruitExpression],
                         ice: nil,
                         author: Author(person: "Norman Jay Hobday",
                                        place: "Henry Africa's: San Francisco, California",
                                        year: "1970s"),
                         spec: lemonDropSpec,
                         tags: lemonDropTags)

var lemonDropSpec  = [CocktailIngredient(.juices(.lemon), value: 1.5),
                      CocktailIngredient(.syrups(.simple), value: 1),
                      CocktailIngredient(.vodkas(.vodkaAny), value: 2)]


var lemonDropTags = Tags(profiles: [.refreshing, .citrusy],
                         styles: [.sour, .shaken])
