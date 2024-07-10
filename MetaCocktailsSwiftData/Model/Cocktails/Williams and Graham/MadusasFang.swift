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

let madusasFangSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                             OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                             OldCocktailIngredient(.liqueurs(.dryCuracao), value: 0.5),
                                             OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                             OldCocktailIngredient(.otherAlcohol(.stGeorgeAbsinthe), value: 1)]


let madusasFangTags = Tags(profiles: [.herbal, .nutty, .fruity, .refreshing, .citrusy],
                           styles: [.sour, .shaken, .tiki])
