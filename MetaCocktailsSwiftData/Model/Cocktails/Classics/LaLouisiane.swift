//
//  LaLouisiane.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var laLouisiane = Cocktail(cocktailName: "La Louisiane",
                           glasswareType: .coupe,
                           garnish: [.maraschinoCherry],
                           ice: nil,
                           author: stanleyArthur,
                           spec: laLouisianeSpec,
                           buildOrder: laLouisianeBuild,
                           tags: laLouisianeTags,
                           variation: .laLouisiane,
                           collection: .originals,
                           titleCocktail: true)

var laLouisianeSpec     =  [OldCocktailIngredient(.otherAlcohol(.absinthe), value: 3, unit: .dashes),
                            OldCocktailIngredient(.bitters(.peychauds), value: 3, unit: .dashes),
                            OldCocktailIngredient(.liqueurs(.benedictine), value: 1),
                            OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                            OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1)]

var laLouisianeTags     = Tags(profiles: [.spiritForward, .rich, .punchy, .bittersweet, .aromatic],
                               styles: [.manhattan, .stirred])

var laLouisianeBuild  = Build(instructions: [Instruction(step: 1, method: "The A La Louisiane (sometimes called De La Louisiane) is the former house drink of historic New Orleans’ restaurant La Louisiane, which was built in 1881. ")])
