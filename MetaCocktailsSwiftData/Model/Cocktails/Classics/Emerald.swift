////
////  Emerald.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI



var emerald = Cocktail(cocktailName: "Emerald",
                       glasswareType: .stemmedGlassware,
                       garnish: [.maraschinoCherry, .lemonExpression],
                       author: nil,
                       spec: emeraldSpec,
                       tags: emeraldTags)

var emeraldSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                        CocktailIngredient(.fortifiedWines(.dolinRouge), value: 1),
                        CocktailIngredient(.whiskies(.irishWhiskeyAny), value: 2)]

var emeraldTags     = Tags(profiles: [.spiritForward, .fruity],
                           styles: [.manhattan, .stirred])

