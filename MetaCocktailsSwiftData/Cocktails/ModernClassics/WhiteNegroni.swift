//
//  WhiteNegroni.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var whiteNegroni  =  Cocktail(cocktailName: "White Negroni",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.grapefruitPeel],
                         ice: .bigRock,
                         author: "Wayne Collins",
                         spec: whiteNegroniSpec,
                         buildOrder: nil,
                         tags: whiteNegroniTags)

var whiteNegroniSpec = [CocktailIngredient(.gin, value: 1),
                   CocktailIngredient(.lilletBlanc, value: 1),
                   CocktailIngredient(.suze, value: 1)]

var whiteNegroniTags = Tags(profiles: [.bittersweet, .floral],
                       textures: [.rich],
                       styles: [.negroni, .stirred],
                            bases: [.gin, .suze, .lilletBlanc])
