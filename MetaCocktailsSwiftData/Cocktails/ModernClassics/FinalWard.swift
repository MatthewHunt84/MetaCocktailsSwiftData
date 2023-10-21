//
//  FinalWard.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var finalWard = Cocktail(cocktailName: "Final Ward",
                         glasswareType: .stemmedGlassware,
                         ice: nil,
                         author: "Phil Ward",
                         spec: finalWardSpec,
                         tags: finalWardTags)

var finalWardSpec  = [CocktailIngredient(.lemon, value: 0.75),
                     CocktailIngredient(.ryeWhiskey, value: 0.75),
                     CocktailIngredient(.maraschinoLiqueur, value: 0.75),
                     CocktailIngredient(.greenChartreuse, value: 0.75)]


var finalWardTags = Tags(textures: [.light],
                        styles: [.sour],
                        bases: [.ryeWhiskey])
