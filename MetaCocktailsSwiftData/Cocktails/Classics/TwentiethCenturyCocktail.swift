//
//  TwentiethCenturyCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var twentiethCenturyCocktail  = Cocktail(cocktailName: "20th Century Cocktail",
                                glasswareType: .coupe,
                                         garnish: [.lemonPeel],
                                ice: nil,
                                author: "C.A. Tuck (1937)",
                                spec: twentiethCenturyCocktailSpec,
                                tags: twentiethCenturyCocktailTags)

var twentiethCenturyCocktailSpec  = [CocktailIngredient(.lemon, value: 0.75),
                                     CocktailIngredient(.cremeDeCacao, value: 0.75),
                                     CocktailIngredient(.lilletBlanc, value: 0.75),
                                     CocktailIngredient(.ginLondonDry, value: 1.5)]


var twentiethCenturyCocktailTags = Tags(textures: [.light],
                                        styles: [.sour, .shaken],
                        bases: [.ginLondonDry])
