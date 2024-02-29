////
////  MartiniOriginal.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI



var martini   = Cocktail(cocktailName: "Martini",
                         glasswareType: .martini,
                         garnish: [.lemonPeel],
                         spec: martiniSpec,
                         tags: martiniTags,
                         variation: .martini,
                         collection: .originals)

var martiniSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                        CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                        CocktailIngredient(.gins(.ginAny), value: 1.5)]

var martiniTags     = Tags(profiles: [.spiritForward, .dry],
                           styles: [.martini, .stirred])

