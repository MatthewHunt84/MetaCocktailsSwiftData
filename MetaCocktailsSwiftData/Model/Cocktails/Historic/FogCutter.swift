//
//  FogCutter.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var fogCutter = Cocktail(cocktailName: "Fog Cutter" + historicTag,
                         glasswareType: .tikiMug,
                         garnish: [.mintBouquet],
                         ice: .pebbleIce,
                         author: Author(person: AuthorNames.traderVic.rawValue,
                                        place: AuthorPlaces.traderVicsBookOfFoodAndDrink.rawValue,
                                        year: "1946"),
                         spec: fogCutterSpec,
                         tags: fogCutterTags,
                         variation: .fogCutter,
                         collection: .originals,
                         titleCocktail: true,
                         historicSpec: .fogCutter)


let fogCutterSpec     = [OldCocktailIngredient(.juices(.lemon), value: 2),
                         OldCocktailIngredient(.juices(.orange), value: 1),
                         OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                         OldCocktailIngredient(.gins(.ginAny), value: 0.5),
                         OldCocktailIngredient(.brandies(.brandyAny), value: 1),
                         OldCocktailIngredient(.rums(.rumPuertoRican), value: 2),
                         OldCocktailIngredient(.fortifiedWines(.sherryAny), value: 0.5)]




let fogCutterTags = Tags(flavors: [.mint],
                         profiles: [.refreshing, .sweet, .citrusy],
                         styles: [.sour, .tiki, .shaken])



