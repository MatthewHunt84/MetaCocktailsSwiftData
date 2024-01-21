//
//  FuegoVioleta.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var fuegoVioleta = Cocktail(cocktailName: "Fuego Violeta",
                            glasswareType: .stemmedGlassware,
                            garnish: [.lemonPeel],
                            author: [Authors.williamsAndGraham.rawValue],
                            spec: fuegoVioletaSpec,
                            buildOrder: nil,
                            tags: fuegoVioletaTags)

var fuegoVioletaSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                         CocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                         CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                         CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var fuegoVioletaTags = Tags(textures: [.light],
                            styles: [.sour, .shaken])

