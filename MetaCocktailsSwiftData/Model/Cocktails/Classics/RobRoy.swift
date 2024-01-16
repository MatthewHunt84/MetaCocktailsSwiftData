////
////  RobRoy.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////
import SwiftUI



var robRoy = Cocktail(cocktailName: "Rob Roy",
                         glasswareType: .stemmedGlassware,
                         garnish: [.maraschinoCherry, .lemonExpression],
                         author: nil,
                         spec: robRoySpec,
                         tags: robRoyTags)

var robRoySpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dash),
                       CocktailIngredient(.fortifiedWines(.rougeVermouth), value: 1),
                       CocktailIngredient(.whiskies(.scotchBlended), value: 2)]

var robRoyTags     = Tags(profiles: [.spiritForward],
                          textures: [.rich],
                          styles: [.manhattan, .stirred])
