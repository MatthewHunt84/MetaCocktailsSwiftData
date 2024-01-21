//
//  NetfilixAndChill.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var netflixAndChill = Cocktail(cocktailName: "Netflix and Chill",
                               glasswareType: .stemmedGlassware,
                               garnish: [.dehydratedOrangeWheel],
                               author: [Authors.williamsAndGraham.rawValue],
                               spec: netflixAndChillSpec,
                               tags: netflixAndChillTags)

var netflixAndChillSpec     =  [CocktailIngredient(.amari(.braulio), value: 0.25),
                                CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 1.5),
                                CocktailIngredient(.gins(.stGeorgeTerroir), value: 1.5)]

var netflixAndChillTags     = Tags(profiles: [.spiritForward],
                                   styles: [.martini, .stirred])

