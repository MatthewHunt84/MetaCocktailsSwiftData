//
//  Hurricane(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hurricaneWnG = Cocktail(cocktailName: "Hurricane (W&G Version)",
                            imageAsset: nil,
                            glasswareType: .tikiMug,
                            garnish: [.orangeFlag],
                            ice: .pebbleIce,
                            author: williamsAndGraham,
                            spec: hurricaneSpecWnG,
                            tags: hurricaneTagsWnG,
                            variation: .hurricane,
                            collection: .williamsAndGraham)

let hurricaneSpecWnG: [OldCocktailIngredient] =  [OldCocktailIngredient(.juices(.lime), value: 1),
                                               OldCocktailIngredient(.juices(.orange), value: 1),
                                               OldCocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon, prep: PrepBible.grenadine),
                                               OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                                                  OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5, prep: PrepBible.passionfruitSyrupPrep),
                                               OldCocktailIngredient(.rums(.plantation3Star), value: 1.5),
                                               OldCocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 1)]

let hurricaneTagsWnG = Tags(profiles: [.refreshing, .tropical, .fruity, .sweet, .punchy],
                            styles: [.sour, .shaken])

