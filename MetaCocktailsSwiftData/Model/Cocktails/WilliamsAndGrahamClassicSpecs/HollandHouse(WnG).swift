//
//  HollandHouse(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hollandHouseCocktailWnG = Cocktail(cocktailName: "Holland House(W&G Version)",
                                       glasswareType: .martini,
                                       garnish: [.lemonPeel],
                                       ice: nil,
                                       author:williamsAndGraham,
                                       spec: hollandHouseCocktailSpecWnG,
                                       tags: hollandHouseCocktailTagsWnG,
                                       variation: .hollandHouse,
                                       collection: .williamsAndGraham)

var hollandHouseCocktailSpecWnG  =  [CocktailIngredient(.juices(.lemon), value: 0.5),
                                     CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.25),
                                     CocktailIngredient(.fortifiedWines(.dolinDry), value: 0.75),
                                     CocktailIngredient(.gins(.geneverBols), value: 1.5)]

var hollandHouseCocktailTagsWnG = Tags( profiles: [.fruity, .citrusy, .dry],
                                        styles: [.sour, .shaken])
