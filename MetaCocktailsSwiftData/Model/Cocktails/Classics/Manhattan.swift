////
////  Manhattan.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI



var manhattan = Cocktail(cocktailName: "Manhattan",
                         glasswareType: .stemmedGlassware,
                         garnish: [.maraschinoCherry, .lemonExpression],
                         author:Author(place: "Most likely the Manhattan Club", year: "1874"),
                         spec: manhattanSpec,
                         tags: manhattanTags,
                         variation: .manhattan,
                         collection: .originals,
                         titleCocktail: true)

var manhattanSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                          OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                          OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

var manhattanTags     = Tags(flavors: [.lemon],
                             profiles: [.spiritForward, .bittersweet],
                             styles: [.manhattan, .stirred])

