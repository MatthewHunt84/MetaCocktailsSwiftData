//
//  Algonquin(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var algonquinWnG  = Cocktail(cocktailName: "Algonquin" + wAndGTitleTag,
                             glasswareType: .martini,
                             garnish: [.noGarnish],
                             author: williamsAndGraham,
                             spec: algonquinWnGSpec,
                             tags: algonquinWnGTags,
                             variation: .algonquin,
                             collection: .williamsAndGraham)

var algonquinWnGSpec  = [OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                         OldCocktailIngredient(.juices(.pineappleJuice), value: 0.75),
                         OldCocktailIngredient(.fortifiedWines(.dolinBlanc), value: 0.25),
                         OldCocktailIngredient(.fortifiedWines(.dolinDry), value: 0.5),
                         OldCocktailIngredient(.whiskies(.rittenhouseRye), value: 1.5)]



var algonquinWnGTags   = Tags(profiles: [.fruity, .light, .dry],
                              styles: [.shaken, .sour])

