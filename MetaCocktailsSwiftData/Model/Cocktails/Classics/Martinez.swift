//
//  Martinez.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var martinez = Cocktail(cocktailName: "Martinez(1884)",
                        glasswareType: .stemmedGlassware,
                        garnish: nil,
                        author: oHByron,
                        spec: martinezSpec,
                        tags: martinezTags)

var martinezSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                         CocktailIngredient(.liqueurs(.dryCuracao), value: 2, unit: .dashes),
                         CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                         CocktailIngredient(.gins(.ginAny), value: 1.5)]

var martinezTags    = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                           styles: [.martini, .stirred])

