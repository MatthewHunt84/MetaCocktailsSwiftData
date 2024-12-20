//
//  MajorBailey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var majorBailey = Cocktail(cocktailName: "Major Bailey",
                           glasswareType: .fizzGlass,
                           garnish: [.mintSprig],
                           ice: .pebbleIce,
                           author: traderVic1947,
                           spec: majorBaileySpec,
                           buildOrder: majorBaileyBuild,
                           tags: majorBaileyTags,
                           variation: .majorBailey,
                           collection: .originals,
                           titleCocktail: true)

let majorBaileySpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 12, unit: .gentlyMuddled),
                                                OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                                OldCocktailIngredient(.juices(.lime), value: 0.25),
                                                OldCocktailIngredient(.syrups(.richSimple), value: 0.5, prep: PrepBible.richSimple),
                                                OldCocktailIngredient(.gins(.haymansLondonDry), value: 2)]


let majorBaileyTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                           styles: [.sour, .shaken])



