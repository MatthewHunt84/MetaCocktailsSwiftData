////
////  FinalWard.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var finalWard = Cocktail(cocktailName: "Final Ward",
                         glasswareType: .stemmedGlassware,
                         ice: nil,
                         author: "Phil Ward",
                         spec: finalWardSpec,
                         tags: finalWardTags)

var finalWardSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.whiskies(.ryeWhiskey), value: 0.75),
                      CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                      CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var finalWardTags = Tags(textures: [.light],
                         styles: [.sour, .shaken])
                  
