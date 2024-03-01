//
//  Cosmonaut.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/1/24.
//

import Foundation

var cosmonaut = Cocktail(cocktailName: "Cosmonaut",
                         glasswareType: .coupe,
                         garnish: nil,
                         author: sashaPetraske,
                         spec: cosmonautSpec,
                         buildOrder: nil,
                         tags: cosmonautTags,
                         collection: .milkAndHoney)

var cosmonautSpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.otherNonAlc(.raspberryPreserves), value: 2, unit: .barSpoons),
                      CocktailIngredient(.gins(.ginAny), value: 2)]

var cosmonautTags = Tags(profiles: [.citrusy, .fruity, .light],
                         styles: [.sour, .shaken])

