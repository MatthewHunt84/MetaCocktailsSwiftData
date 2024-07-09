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

var northmansConquestSpec = [OldCocktailIngredient(.fortifiedWines(.lustauPX), value: 0.25),
                             OldCocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                             OldCocktailIngredient(.brandies(.boulardCalvados), value: 1),
                             OldCocktailIngredient(.rums(.plantationBarbadosXO), value: 1)]

var northmansConquestTags = Tags(profiles: [.rich, .bittersweet, .punchy, .fruity, .spiritForward],
                                 styles: [.martini, .stirred])
