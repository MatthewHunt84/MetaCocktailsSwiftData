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
                                       author: Author(person: AuthorNames.nickTouch.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2015"),
                                       spec: lordTouchingtonsDelightSpec,
                                       tags: lordTouchingtonsDelightTags,
                                       collection: .williamsAndGraham)

let lordTouchingtonsDelightSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lime), value: 0.5),
                                                            OldCocktailIngredient(.juices(.pineappleJuice), value: 0.5),
                                                            OldCocktailIngredient(.juices(.orange), value: 0.5),
                                                            OldCocktailIngredient(.bitters(.tikiBitters), value: 1, unit: .dashes),
                                                            OldCocktailIngredient(.otherNonAlc(.coconutCream), value: 1),
                                                            OldCocktailIngredient(.liqueurs(.anchoRayesAncho), value: 1),
                                                            OldCocktailIngredient(.agaves(.puebloViejoBlanco104), value: 0.5),
                                                            OldCocktailIngredient(.agaves(.tequilaOchoBlanco), value: 1)]


let lordTouchingtonsDelightTags = Tags(profiles: [.complex, .fruity, .punchy, .refreshing],
                                       styles: [.sour, .shaken, .tiki])

