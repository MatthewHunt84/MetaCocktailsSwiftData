//
//  MedusasFang.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var medusasFang = Cocktail(cocktailName: "Medusa's Fang",
                           glasswareType: .doubleOld,
                           garnish: [.mintSprig, .pineappleFronds],
                           ice: .pebbleIce,
                           author: Author(person: AuthorNames.whitneyAllen.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                           spec: medusasFangSpec,
                           tags: medusasFangTags,
                           collection: .williamsAndGraham)

let medusasFangSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                                OldCocktailIngredient(.liqueurs(.dryCuracao), value: 0.5),
                                                OldCocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.5),
                                                OldCocktailIngredient(.otherAlcohol(.stGeorgeAbsinthe), value: 1)]


let medusasFangTags = Tags(flavors: [.mint],
                           profiles: [.herbal, .nutty, .fruity, .refreshing, .citrusy],
                           styles: [.sour, .shaken, .tiki])
