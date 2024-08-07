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
                                    tags: hollandHouseCocktailTags,
                                    variation: .hollandHouse,
                                    collection: .originals,
                                    titleCocktail: true)

var hollandHouseCocktailSpec  =  [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                  OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 4, unit: .dashes),
                                  OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                                  OldCocktailIngredient(.fruit(.pineapple), value: 1, unit: .sliceOf),
                                  OldCocktailIngredient(.gins(.ginLondonDry), value: 2)]

var hollandHouseCocktailTags = Tags( profiles: [.fruity, .citrusy, .dry],
                                     styles: [.daisy, .shaken, .sour])

///
