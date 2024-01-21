////
////  CropTop.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var cropTop = Cocktail(cocktailName: "Crop Top",
                       glasswareType: .nickAndNora,
                            garnish: [.grapefruitExpression],
                            ice: nil,
                            author: ["Devon Tarby (2013)", Authors.deathAndCo.rawValue],
                            spec: cropTopSpec,
                            tags: cropTopTags)

var cropTopSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                    CocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                    CocktailIngredient(.amari(.amaroMontenegro), value: 0.75),
                    CocktailIngredient(.liqueurs(.giffardPamplemousse), value: 0.75)]


var cropTopTags = Tags(profiles: [.refreshing, .floral, .herbal],
                       textures: [.light],
                       styles: [.sour, .shaken])
                       
