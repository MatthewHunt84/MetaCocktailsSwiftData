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
                         author:Author(person: AuthorNames.philWard.rawValue,
                                       place: AuthorPlaces.deathAndCo.rawValue),
                         spec: finalWardSpec,
                         tags: finalWardTags)

var finalWardSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 0.75),
                      CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                      CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var finalWardTags = Tags(profiles: [.light],
                         styles: [.sour, .shaken])
                  
