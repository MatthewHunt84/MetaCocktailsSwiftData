////
////  RobRoy.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////
import SwiftUI



var robRoy = Cocktail(cocktailName: "Rob Roy",
                      glasswareType: .stemmedGlassware,
                      garnish: [.maraschinoCherry, .orangeExpress],
                      author: nil,
                      spec: robRoySpec,
                      tags: robRoyTags)

var robRoySpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                       CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                       CocktailIngredient(.whiskies(.scotchBlended), value: 2)]

var robRoyTags     = Tags(profiles: [.spiritForward, .punchy, .fruity],
                          styles: [.manhattan, .stirred])
