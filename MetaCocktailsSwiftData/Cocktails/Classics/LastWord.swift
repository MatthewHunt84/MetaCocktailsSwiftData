//
//  LastWord.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var lastWord = Cocktail(cocktailName: "Last Word",
                        glasswareType: .stemmedGlassware,
                        ice: nil,
                        author: "Frank Fogarty or the Detroit Athletic club",
                        spec: lastWordSpec,
                        buildOrder: nil,
                        tags: lastWordTags)

var lastWordSpec  = [CocktailIngredient(.lime, value: 0.75),
                     CocktailIngredient(.ginLondonDry, value: 0.75),
                     CocktailIngredient(.maraschinoLiqueur, value: 0.75),
                     CocktailIngredient(.greenChartreuse, value: 0.75)]


var lastWordTags = Tags(textures: [.light],
                        styles: [.sour, .shaken],
                        bases: [.ginLondonDry, .maraschinoLiqueur, .greenChartreuse])
