////
////  TwentiethCenturyCocktail.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var twentiethCenturyCocktail  = Cocktail(cocktailName: "20th Century Cocktail",
                                         glasswareType: .coupe,
                                         garnish: [.lemonPeel],
                                         ice: nil,
                                         author:Author(person: "C.A. Tuck", year: "1937"),
                                         spec: twentiethCenturyCocktailSpec,
                                         tags: twentiethCenturyCocktailTags,
                                         collection: .originals)

var twentiethCenturyCocktailSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                                     CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                     CocktailIngredient(.fortifiedWines(.lilletBlanc), value: 0.75),
                                     CocktailIngredient(.gins(.ginLondonDry), value: 1.5)]

var twentiethCenturyCocktailTags = Tags(profiles: [.light, .complex, .citrusy],
                                        styles: [.sour, .shaken])

