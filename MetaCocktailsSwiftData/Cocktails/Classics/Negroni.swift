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

var negroniSpec = [CocktailIngredient(.gin, value: 1, unit: .fluidOunces),
                   CocktailIngredient(.sweetVermouth, value: 1, unit: .fluidOunces),
                   CocktailIngredient(.campari, value: 1, unit: .fluidOunces)]

var negroniTags = Tags(flavors: [.orange, .bakingSpices], 
                       profiles: [.bitter, .sweet, .floral],
                       textures: [.rich],
                       styles: [.negroni, .stirred],
                       bases: [.gin])
