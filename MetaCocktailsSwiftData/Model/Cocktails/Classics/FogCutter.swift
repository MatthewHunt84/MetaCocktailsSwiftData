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
                         tags: fogCutterTags,
                         variation: .fogCutter,
                         collection: .originals,
                         titleCocktail: true)


let fogCutterSpec     = [OldCocktailIngredient(.juices(.lemon), value: 2),
                         OldCocktailIngredient(.juices(.orange), value: 1),
                         OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                         OldCocktailIngredient(.gins(.ginAny), value: 0.5),
                         OldCocktailIngredient(.brandies(.brandyAny), value: 1),
                         OldCocktailIngredient(.rums(.rumPuertoRican), value: 2),
                         OldCocktailIngredient(.fortifiedWines(.sherryAny), value: 0.5)]




let fogCutterTags = Tags(profiles: [.refreshing, .sweet, .citrusy],
                         styles: [.sour, .tiki, .shaken])


var fogCutterBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sherry, into a tin and shake with ice."),
                                          Instruction(step: 2, method: "Strain into a tiki mug and add pebble ice."),
                                          Instruction(step: 3, method: "Garnish with a mint bouquet and then float the sherry on top.")])
