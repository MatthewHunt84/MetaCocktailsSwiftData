//
//  HollandHouseCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hollandHouseCocktail = Cocktail(cocktailName: "Holland House Cocktail",
                                    glasswareType: .stemmedGlassware,
                                    garnish: nil,
                                    ice: nil,
                                    author: harryCraddock,
                                    spec: hollandHouseCocktailSpec,
                                    tags: hollandHouseCocktailTags)
var hollandHouseCocktailSpec  =  [CocktailIngredient(.juices(.lemon), value: 0.25),
                                  CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 4, unit: .dashes),
                                  CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                                  CocktailIngredient(.fruit(.pineapple), value: 1, unit: .sliceOf),
                                  CocktailIngredient(.gins(.ginLondonDry), value: 2)]
var hollandHouseCocktailTags = Tags( profiles: [.fruity, .citrusy, .dry],
                                     styles: [.sour, .shaken])

///
