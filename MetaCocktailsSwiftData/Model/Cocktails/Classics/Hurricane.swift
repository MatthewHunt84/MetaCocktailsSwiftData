//
//  Hurricane.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hurricane = Cocktail(cocktailName: "Hurricane",
                         glasswareType: .hurricaneGlass,
                         garnish: [.maraschinoCherry, .halfOrangeWheel],
                         ice: .pebbleIce,
                         author: Author(person: "Louis Culligan", place: "Pat O'Brian's, New Orleans", year: "1939" ),
                         spec: hurricaneSpec,
                         tags: hurricaneTags,
                         variation: .hurricane,
                         collection: .originals,
                         titleCocktail: true)

let hurricaneSpec: [OldCocktailIngredient] =  [OldCocktailIngredient(.juices(.lemon), value: 2),
                                            OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 2, prep: PrepBible.passionfruitSyrupPrep),
                                            OldCocktailIngredient(.rums(.rumJamaicanAged), value: 4)]

let hurricaneTags = Tags(profiles: [.refreshing, .tropical, .fruity, .sweet, .punchy],
                         styles: [.sour, .shaken])

