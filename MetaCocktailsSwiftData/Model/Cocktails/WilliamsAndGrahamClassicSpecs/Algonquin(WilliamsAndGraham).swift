//
//  Algonquin(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var algonquinWnG  = Cocktail(cocktailName: "Algonquin (W&G Version)",
                             glasswareType: .martini,
                             garnish: [.noGarnish],
                             author: williamsAndGraham,
                             spec: algonquinWnGSpec,
                             tags: algonquinWnGTags,
                             variation: .algonquin,
                             collection: .williamsAndGraham)

var algonquinWnGSpec  = [CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                         CocktailIngredient(.juices(.pineappleJuice), value: 0.75),
                         CocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.25),
                         CocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                         CocktailIngredient(.whiskies(.rittenhouseRye), value: 1.5)]



var algonquinWnGTags   = Tags(profiles: [.fruity, .light, .dry],
                              styles: [.shaken, .sour])

