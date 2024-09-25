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


var martiniNotes = "The Martini, predating the Manhattan, has evolved significantly over time. Its original recipe featured more vermouth than gin, later shifting to equal parts, then progressively less vermouth. By the 1910s, vodka began replacing gin in some versions. The 1950s saw vermouth becoming almost taboo in certain circles, while olive brine gained popularity. Given its varied history, it's crucial to clarify a guest's preferences when they order a Martini. Their ideal version may differ greatly from the traditional recipe or your own interpretation. This cocktail's transformation illustrates how drink recipes can change dramatically over time, reflecting shifting tastes and cultural trends."
