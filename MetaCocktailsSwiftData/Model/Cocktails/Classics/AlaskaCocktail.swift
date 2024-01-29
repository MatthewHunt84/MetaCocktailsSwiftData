//
//  AlaskaCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var alaska  = Cocktail(cocktailName: "Alaska Cocktail",
                          glasswareType: .martini,
                          garnish: [.noGarnish],
                          author: Author(place: "'Fashions in Mixed Drinks.' Guthrie Daily Leader", year: "October 18, 1905"),
                          spec: alaskaSpec,
                          tags: alaskaTags)

var alaskaSpec  = [CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                   CocktailIngredient(.gins(.ginLondonDry), value: 2.25)]



var alaskaTags   = Tags(profiles: [.spiritForward, .rich],
                        styles: [.stirred, .martini])

