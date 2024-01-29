//
//  Alaska(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var alaskaWnG  = Cocktail(cocktailName: "Alaska Cocktail (Williams and Graham spec.)",
                          glasswareType: .nickAndNora,
                          garnish: [.lemonPeel],
                          author: Author(place: "'Fashions in Mixed Drinks.' Guthrie Daily Leader", year: "October 18, 1905"),
                          spec: alaskaWnGSpec,
                          tags: alaskaWnGTags)

var alaskaWnGSpec  = [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                      CocktailIngredient(.gins(.fordsGin), value: 2.25)]



var alaskaWnGTags   = Tags(profiles: [.spiritForward],
                           textures: [.rich],
                           styles: [.stirred, .martini])

