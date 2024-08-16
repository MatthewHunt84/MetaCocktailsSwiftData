//
//  Alaska(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var alaskaWnG  = Cocktail(cocktailName: "Alaska Cocktail (W&G Version)",
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          author: williamsAndGraham,
                          spec: alaskaWnGSpec,
                          tags: alaskaWnGTags,
                          variation: .alaska,
                          collection: .williamsAndGraham)

var alaskaWnGSpec  = [OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                      OldCocktailIngredient(.gins(.fordsGin), value: 2.25)]



var alaskaWnGTags   = Tags(flavors: [.lemon],
                           profiles: [.spiritForward, .rich],
                           styles: [.stirred, .martini])

