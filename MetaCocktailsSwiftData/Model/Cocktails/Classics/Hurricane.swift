//
//  Hurricane.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hurricane = Cocktail(cocktailName: "Hurricane",
                         imageAsset: nil,
                         glasswareType: .hurricaneGlass,
                         garnish: [.orangeFlag],
                         ice: .pebbleIce,
                         author: Author(person: "Louis Culligan", place: "Pat O'Brian's, New Orleans", year: "1939" ),
                         spec: hurricaneSpec,
                         tags: hurricaneTags,
                         variation: .hurricane,
                         collection: .originals,
                         titleCocktail: true)

let hurricaneSpec: [CocktailIngredient] =  [CocktailIngredient(.juices(.lemon), value: 2),
                                            CocktailIngredient(.syrups(.passionfruitSyrup), value: 2),
                                            CocktailIngredient(.rums(.rumJamaicanAged), value: 4)]

let hurricaneTags = Tags(profiles: [.refreshing, .tropical, .fruity, .sweet, .punchy],
                         styles: [.sour, .shaken])

