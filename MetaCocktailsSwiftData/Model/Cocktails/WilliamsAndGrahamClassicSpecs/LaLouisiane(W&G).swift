//
//  LaLouisiane(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var laLouisianeWnG = Cocktail(cocktailName: "La Louisiane" + wAndGTitleTag,
                              glasswareType: .coupe,
                              garnish: [.maraschinoCherry],
                              ice: nil,
                              author: williamsAndGraham,
                              spec: laLouisianeWnGSpec,
                              tags: laLouisianeWnGTags,
                              variation: .laLouisiane,
                              collection: .williamsAndGraham)

var laLouisianeWnGSpec     =  [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 6, unit: .dashes),
                               OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                               OldCocktailIngredient(.liqueurs(.benedictine), value: 0.25),
                               OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                               OldCocktailIngredient(.whiskies(.jimBeamRye), value: 2)]

var laLouisianeWnGTags     = Tags(profiles: [.spiritForward, .rich, .punchy, .bittersweet, .aromatic],
                                  styles: [.manhattan, .stirred])

