////
////  Negroni.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/6/23.
////

import SwiftUI

var negroni  =  Cocktail(cocktailName: "Negroni",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author: "Count Camillo Negroni",
                         spec: negroniSpec,
                         buildOrder: nil,
                         tags: negroniTags)

var negroniSpec = [CocktailIngredient(.gins(.gin), value: 1),
                   CocktailIngredient(.fortifiedWines(.sweetVermouth), value: 1),
                   CocktailIngredient(.amari(.campari), value: 1)]

var negroniTags = Tags(flavors: [.orange],
                       profiles: [.bittersweet, .spiritForward, .bitter],
                       textures: [.rich],
                       styles: [.negroni, .stirred])
                       
                     
