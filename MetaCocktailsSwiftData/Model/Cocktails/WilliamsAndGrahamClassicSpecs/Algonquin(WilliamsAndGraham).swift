//
//  Algonquin(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var algonquinWnG  = Cocktail(cocktailName: "Algonquin (Williams & Graham spec.)",
                             glasswareType: .martini,
                             garnish: [.noGarnish],
                             spec: algonquinWnGSpec,
                             tags: algonquinWnGTags)

var algonquinWnGSpec  = [CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                         CocktailIngredient(.juices(.pineappleJuice), value: 0.75),
                         CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.25),
                         CocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                         CocktailIngredient(.whiskies(.rittenhouseRye), value: 1.5)]



var algonquinWnGTags   = Tags(profiles: [.fruity, .light],
                              styles: [.shaken, .sour])

