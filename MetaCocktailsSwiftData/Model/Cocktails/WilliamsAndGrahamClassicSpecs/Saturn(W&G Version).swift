//
//  Saturn (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var saturnWnG = Cocktail(cocktailName: "Saturn (W&G Version)",
                         glasswareType: .doubleOld,
                         garnish: [.pineappleFrond, .lemonWheel],
                         ice: .pebbleIce,
                         author: williamsAndGraham,
                         spec: saturnSpecWnG,
                         notes: saturnNotes,
                         tags: saturnTagsWnG,
                         variation: .saturn,
                         collection: .williamsAndGraham)

var saturnSpecWnG  =  [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                       OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75, prep: PrepBible.passionfruitSyrupPrep),
                       OldCocktailIngredient(.syrups(.orgeat), value: 0.25, prep: PrepBible.orgeat),
                       OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                       OldCocktailIngredient(.gins(.fordsGin), value: 1.5)]

var saturnTagsWnG = Tags( profiles: [.citrusy, .fruity, .tropical, .sweet, .refreshing, .floral, .light],
                       styles: [.tiki, .shaken, .sour])
