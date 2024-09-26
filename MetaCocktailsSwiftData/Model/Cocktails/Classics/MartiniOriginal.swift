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


var martiniNotes = "The Martini - which predates the Manhattan - has evolved significantly over time. The original recipe featured more vermouth than gin, later shifting to equal parts, then progressively less vermouth. By the 1910s, vodka began replacing gin in some versions. By the 1950s, without the botanical profile of gin to accompany it, vermouth lost popularity with olive brine often taking its place. While this is an excellent recipe for a classic Martini, the most important recipe for a Martini is the one the drinker asks you for."
