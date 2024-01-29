//
//  FogCutter.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fogCutter = Cocktail(cocktailName: "Fog Cutter",
                         imageAsset: nil,
                         glasswareType: .tikiMug,
                         garnish: [.mintBouquet],
                         ice: .pebbleIce,
                         author: Author(person: AuthorNames.traderVic.rawValue,
                                        year: "1940"),
                         spec: fogCutterSpec,
                         tags: fogCutterTags)


let fogCutterSpec     = [CocktailIngredient(.juices(.lemon), value: 2),
                            CocktailIngredient(.juices(.orange), value: 1),
                            CocktailIngredient(.syrups(.orgeat), value: 0.5),
                            CocktailIngredient(.gins(.ginAny), value: 0.5),
                            CocktailIngredient(.brandies(.brandyAny), value: 1),
                            CocktailIngredient(.rums(.rumPuertoRican), value: 2),
                            CocktailIngredient(.fortifiedWines(.sherryAny), value: 0.5, unit: .fluidOuncesFloated)]




let fogCutterTags = Tags(profiles: [.refreshing, .sweet, .citrusy],
                         styles: [.sour, .tiki, .shaken])

