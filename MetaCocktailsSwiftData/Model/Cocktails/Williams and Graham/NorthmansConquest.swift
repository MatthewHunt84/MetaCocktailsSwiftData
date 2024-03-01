//
//  NorthmansConquest.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var northmansConquest  =  Cocktail(cocktailName: "Northmans Conquest",
                                   glasswareType: .doubleOld,
                                   garnish: [.maraschinoCherry],
                                   ice: .bigRock,
                                   author: justWnG,
                                   spec: northmansConquestSpec,
                                   buildOrder: nil,
                                   tags: northmansConquestTags,
                                   collection: .williamsAndGraham)

var northmansConquestSpec = [CocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                             CocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                             CocktailIngredient(.brandies(.boulardCalvados), value: 1),
                             CocktailIngredient(.rums(.plantationBarbadosXO), value: 1)]

var northmansConquestTags = Tags(profiles: [.rich, .bittersweet, .punchy, .fruity, .spiritForward],
                                 styles: [.martini, .stirred])
