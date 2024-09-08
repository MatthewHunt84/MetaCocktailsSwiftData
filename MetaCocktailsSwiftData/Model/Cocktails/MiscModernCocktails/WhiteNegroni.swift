////
////  WhiteNegroni.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var whiteNegroni  =  Cocktail(cocktailName: "White Negroni",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.grapefruitPeel],
                         ice: .bigRock,
                              author: Author(person: "Wayne Collins", place: "London"),
                         spec: whiteNegroniSpec,
                         buildOrder: nil,
                         tags: whiteNegroniTags)

var whiteNegroniSpec = [OldCocktailIngredient(.gins(.ginAny), value: 1),
                        OldCocktailIngredient(.fortifiedWines(.lilletBlanc), value: 1),
                        OldCocktailIngredient(.amari(.suze), value: 1)]

var whiteNegroniTags = Tags(flavors: [.grapefruit],
                            profiles: [.bittersweet, .floral, .punchy, .bitter],
                            styles: [.negroni, .stirred])

