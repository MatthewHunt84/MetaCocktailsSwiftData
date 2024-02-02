//
//  WhiteLady.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var whiteLady = Cocktail(cocktailName: "White Lady(Savoy version)",
                         glasswareType: .martini,
                         garnish: nil,
                         author: williamsAndGraham,
                         spec: whiteLadySpec,
                         tags: whiteLadyTags)

var whiteLadySpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                      CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                      CocktailIngredient(.gins(.fordsGin), value: 1.5)]


var whiteLadyTags = Tags(profiles: [.citrusy, .fruity, .light, .dry],
                         styles: [.daisy, .shaken])

