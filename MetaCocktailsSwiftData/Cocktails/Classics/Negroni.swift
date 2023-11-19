//
//  Negroni.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/6/23.
//

import SwiftUI

var negroni  =  Cocktail(cocktailName: "Negroni",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author: "Count Camillo Negroni",
                         spec: negroniSpec,
                         buildOrder: nil,
                         tags: negroniTags)

var negroniSpec = [CocktailIngredient(.gin, value: 1),
                   CocktailIngredient(.sweetVermouth, value: 1),
                   CocktailIngredient(.campari, value: 1)]

var negroniTags = Tags(flavors: [.orange],
                       profiles: [.bittersweet],
                       textures: [.rich],
                       styles: [.negroni, .stirred],
                       bases: [.gin, .sweetVermouth, .campari])
