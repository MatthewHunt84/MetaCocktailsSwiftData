//
//  Saturn(W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var saturnWnG = Cocktail(cocktailName: "Saturn(W&G Version)",
                         glasswareType: .doubleOld,
                         garnish: [.pineappleFrond, .lemonWheel],
                         ice: .pebbleIce,
                         author: williamsAndGraham,
                         spec: saturnSpecWnG,
                         buildOrder: saturnBuildOrder,
                         tags: saturnTagsWnG,
                         variation: .saturn)

var saturnSpecWnG  =  [CocktailIngredient(.juices(.lemon), value: 0.75),
                       CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75),
                       CocktailIngredient(.syrups(.orgeat), value: 0.25, prep: PrepBible.orgeat),
                       CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                       CocktailIngredient(.gins(.fordsGin), value: 1.5)]

var saturnTagsWnG = Tags( profiles: [.citrusy, .fruity, .tropical, .sweet, .refreshing, .floral, .light],
                       styles: [.tiki, .shaken, .sour])
