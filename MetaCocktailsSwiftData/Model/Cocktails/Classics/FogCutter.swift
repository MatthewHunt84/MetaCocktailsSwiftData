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

let fogCutterSpec     = [CocktailIngredient(.juices(.lemon), value:0.75),
                         CocktailIngredient(.juices(.orange), value: 1),
                         CocktailIngredient(.syrups(.orgeat), value: 0.5),
                         CocktailIngredient(.gins(.ransomOldTom), value: 0.25),
                         CocktailIngredient(.brandies(.pFAmber), value: 0.5),
                         CocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                         CocktailIngredient(.fortifiedWines(.sherryEastIndia), value: 0.5, unit: .fluidOuncesFloated)]


let fogCutterTags = Tags(profiles: [.refreshing, .sweet, .citrusy],
                         styles: [.sour, .tiki, .shaken])

