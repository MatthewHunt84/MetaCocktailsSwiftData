//
//  MadusasFang.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var madusasFang = Cocktail(cocktailName: "Madusa's Fang",
                           imageAsset: nil,
                           glasswareType: .doubleOld,
                           garnish: [.mintSprig, .pineappleFronds],
                           ice: .pebbleIce,
                           author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                           spec: madusasFangSpec,
                           tags: madusasFangTags,
                           collection: .williamsAndGraham)

let madusasFangSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lemon), value: 0.75),
                                             CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                             CocktailIngredient(.liqueurs(.dryCuracao), value: 0.5),
                                             CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                             CocktailIngredient(.otherAlcohol(.stGeorgeAbsinthe), value: 1)]


let madusasFangTags = Tags(profiles: [.herbal, .nutty, .fruity, .refreshing, .citrusy],
                           styles: [.sour, .shaken, .tiki])
