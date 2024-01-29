//
//  Alaska(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var alaskaWnG  = Cocktail(cocktailName: "Alaska Cocktail(W&G)",
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          author: williamsAndGraham,
                          spec: alaskaWnGSpec,
                          tags: alaskaWnGTags)

var alaskaWnGSpec  = [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                      CocktailIngredient(.gins(.fordsGin), value: 2.25)]



var alaskaWnGTags   = Tags(profiles: [.spiritForward, .rich],
                           styles: [.stirred, .martini])

