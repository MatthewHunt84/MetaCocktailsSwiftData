//
//  LordTouchingtonsDelight.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var lordTouchingtonsDelight = Cocktail(cocktailName: "Lord Touchingtons Delight",
                                       imageAsset: nil,
                                       glasswareType: .tikiMug,
                                       garnish: [.pineappleFrond, .orangeFlag],
                                       ice: .pebbleIce,
                                       author: Author(person: "Nick Touch", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2015"),
                                       spec: lordTouchingtonsDelightSpec,
                                       tags: lordTouchingtonsDelightTags,
                                       collection: .williamsAndGraham)

let lordTouchingtonsDelightSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.5),
                                                         CocktailIngredient(.juices(.pineappleJuice), value: 0.5),
                                                         CocktailIngredient(.juices(.orange), value: 0.5),
                                                         CocktailIngredient(.bitters(.tikiBitters), value: 1, unit: .dashes),
                                                         CocktailIngredient(.otherNonAlc(.coconutCream), value: 1),
                                                         CocktailIngredient(.liqueurs(.anchoRayesAncho), value: 1),
                                                         CocktailIngredient(.agaves(.puebloViejoBlanco104), value: 0.5),
                                                         CocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1)]


let lordTouchingtonsDelightTags = Tags(profiles: [.complex, .fruity, .punchy, .refreshing],
                                       styles: [.sour, .shaken, .tiki])

