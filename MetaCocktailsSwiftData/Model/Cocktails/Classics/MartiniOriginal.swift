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
                         titleCocktail: true)

var martiniSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                        OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1.5),
                        OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var martiniTags     = Tags(flavors: [.lemon],
                           profiles: [.spiritForward, .dry],
                           styles: [.martini, .stirred])



