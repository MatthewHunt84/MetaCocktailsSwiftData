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
                            author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: fuegoVioletaSpec,
                            buildOrder: nil,
                            tags: fuegoVioletaTags,
                            collection: .williamsAndGraham)

var fuegoVioletaSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                         OldCocktailIngredient(.gins(.ginLondonDry), value: 0.75),
                         OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                         OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var fuegoVioletaTags = Tags(flavors: [.lemon],
                            profiles: [.light, .floral, .herbal, .fruity],
                            styles: [.sour, .shaken])

