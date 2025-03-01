//
//  MoscowMule.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var moscowMule  = Cocktail(cocktailName: "Moscow Mule",
                           glasswareType: .copperMuleCup,
                           garnish: [.limeWheel],
                           ice: nil,
                           author: Author(place: "Cock 'n Bull Pub, Los Angeles", year: "1941"),
                           spec: moscowMuleSpec,
                           tags: moscowMuleTags)

var moscowMuleSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                       OldCocktailIngredient(.soda(.gingerBeer), value: 3, prep: PrepBible.gingerBeer),
                       OldCocktailIngredient(.vodkas(.vodkaAny), value: 2)]


var moscowMuleTags   = Tags(profiles: [.citrusy, .effervescent, .light, .refreshing],
                            styles: [.fizz, .built])

