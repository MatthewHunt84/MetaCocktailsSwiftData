//
//  Emerald.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI



var emerald = Cocktail(cocktailName: "Emerald",
                         glasswareType: .stemmedGlassware,
                         garnish: [.maraschinoCherry, .lemonExpression],
                         author: nil,
                         spec: emeraldSpec,
                         tags: emeraldTags)


var emeraldSpec     =  [CocktailIngredient(.angosturaBitters, value: 2, unit: .dash),
                          CocktailIngredient(.rougeVermouth, value: 1),
                          CocktailIngredient(.irishWhiskey, value: 2)]


var emeraldTags     = Tags(profiles: [.spiritForward],
                             textures: [.rich],
                             styles: [.manhattan],
                          bases: [.irishWhiskey])
