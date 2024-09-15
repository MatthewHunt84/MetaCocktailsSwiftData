//
//  Honeymoon(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var honeymoonCocktailWnG = Cocktail(cocktailName: "Honeymoon(WnG Version)",
                                    glasswareType: .martini,
                                    garnish: [.maraschinoCherry, .halfOrangeWheel],
                                    ice: nil,
                                    author: williamsAndGraham,
                                    spec: honeymoonCocktailSpecWnG,
                                    tags: honeymoonCocktailTagsWnG,
                                    variation: .honeymoon,
                                    collection: .williamsAndGraham)

var honeymoonCocktailSpecWnG =  [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                 OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5, unit: .dashes),
                                 OldCocktailIngredient(.liqueurs(.benedictine), value: 0.5),
                                 OldCocktailIngredient(.brandies(.boulardCalvados), value: 1.5)]

var honeymoonCocktailTagsWnG = Tags( profiles: [.fruity, .citrusy],
                                     styles: [.sour, .shaken])
