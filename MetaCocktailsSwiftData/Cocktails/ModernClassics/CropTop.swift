//
//  CropTop.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var cropTop = Cocktail(cocktailName: "Crop Top",
                       glasswareType: .nickAndNora,
                            garnish: [.grapefruitExpression],
                            ice: nil,
                            author: "Devon Tarby (2013)",
                            spec: cropTopSpec,
                            tags: cropTopTags)

var cropTopSpec  = [CocktailIngredient(.lemon, value: 0.75),
                     CocktailIngredient(.ginLondonDry, value: 0.75),
                     CocktailIngredient(.amaroMontenegro, value: 0.75),
                     CocktailIngredient(.giffardPamplemousse, value: 0.75)]


var cropTopTags = Tags(profiles: [.refreshing, .floral, .herbal],
                       textures: [.light],
                       styles: [.sour, .shaken],
                       bases: [.gin])
