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
                         tags: manhattanTags)

var manhattanSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                          CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                          CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

var manhattanTags     = Tags(profiles: [.spiritForward],
                             textures: [.rich],
                             styles: [.manhattan, .stirred])
                        
