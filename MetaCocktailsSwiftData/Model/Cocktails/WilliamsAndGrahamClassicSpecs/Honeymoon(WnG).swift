//
//  Honeymoon(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var honeymoonCocktailWnG = Cocktail(cocktailName: "Honeymoon(WnG)",
                                    glasswareType: .martini,
                                    garnish: [.orangeFlag],
                                    ice: nil,
                                    author: williamsAndGraham,
                                    spec: honeymoonCocktailSpecWnG,
                                    tags: honeymoonCocktailTagsWnG)
var honeymoonCocktailSpecWnG =  [CocktailIngredient(.juices(.lemon), value: 0.5),
                                 CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5, unit: .dashes),
                                 CocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                                 CocktailIngredient(.brandies(.boulardCalvados), value: 1.5)]
var honeymoonCocktailTagsWnG = Tags( profiles: [.fruity, .citrusy],
                                     styles: [.sour, .shaken])
