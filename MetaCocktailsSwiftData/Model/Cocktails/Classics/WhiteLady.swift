//
//  WhiteLady.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var whiteLady = Cocktail(cocktailName: "White Lady",
                         glasswareType: .martini,
                         garnish: nil,
                         author: harryCraddock,
                         spec: whiteLadySpec,
                         tags: whiteLadyTags,
                         collection: .originals)

var whiteLadySpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                      OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                      OldCocktailIngredient(.gins(.fordsGin), value: 1.5)]


var whiteLadyTags = Tags(profiles: [.citrusy, .fruity, .light, .dry],
                         styles: [.daisy, .shaken])

