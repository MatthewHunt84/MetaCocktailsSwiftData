//
//  LaLouisiane(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var laLouisianeWnG = Cocktail(cocktailName: "La Louisiane(W&G Version)",
                              glasswareType: .coupe,
                              garnish: [.maraschinoCherry],
                              ice: nil,
                              author: williamsAndGraham,
                              spec: laLouisianeWnGSpec,
                              tags: laLouisianeWnGTags,
                              variation: .laLouisiane)

var laLouisianeWnGSpec     =  [CocktailIngredient(.otherAlcohol(.absinthe), value: 6, unit: .dashes),
                               CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                               CocktailIngredient(.liqueurs(.benedictine), value: 0.25),
                               CocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                               CocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var laLouisianeWnGTags     = Tags(profiles: [.spiritForward, .rich, .punchy, .bittersweet, .aromatic],
                                  styles: [.manhattan, .stirred])

