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

let hurricaneSpecWnG: [CocktailIngredient] =  [CocktailIngredient(.juices(.lime), value: 1),
                                               CocktailIngredient(.juices(.orange), value: 1),
                                               CocktailIngredient(.syrups(.grenadine), value: 1, unit: .barSpoon),
                                               CocktailIngredient(.syrups(.simple), value: 0.5),
                                               CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.5),
                                               CocktailIngredient(.rums(.plantation3Star), value: 1.5),
                                               CocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 1)]

let hurricaneTagsWnG = Tags(profiles: [.refreshing, .tropical, .fruity, .sweet, .punchy],
                            styles: [.sour, .shaken])

