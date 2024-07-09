//
//  Martinez.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var martinez = Cocktail(cocktailName: "Martinez",
                        glasswareType: .stemmedGlassware,
                        garnish: nil,
                        author: oHByron,
                        spec: martinezSpec,
                        tags: martinezTags,
                        variation: .martinez,
                        collection: .originals,
                        titleCocktail: true)

var martinezSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                         OldCocktailIngredient(.liqueurs(.dryCuracao), value: 2, unit: .dashes),
                         OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1.5),
                         OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var martinezTags    = Tags(profiles: [.spiritForward, .rich, .complex, .bittersweet],
                           styles: [.martini, .stirred])

