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
                         author:Author(person: "Count Camillo Negroni"),
                         spec: negroniSpec,
                         buildOrder: nil,
                         tags: negroniTags)

var negroniSpec = [CocktailIngredient(.gins(.ginAny), value: 1),
                   CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                   CocktailIngredient(.amari(.campari), value: 1)]

var negroniTags = Tags(flavors: [.orange],
                       profiles: [.bittersweet, .spiritForward, .rich],
                       styles: [.negroni, .stirred])
                       
                     
