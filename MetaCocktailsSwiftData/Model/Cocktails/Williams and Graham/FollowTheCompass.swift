//
//  FollowTheCompass.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var followTheCompass = Cocktail(cocktailName: "Follow The Compass",
                                imageAsset: nil,
                                glasswareType: .doubleOld,
                                garnish: [.grapefruitPeel],
                                ice: .bigRock,
                                author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                                spec: followTheCompassSpec,
                                tags: followTheCompassTags,
                                collection: .williamsAndGraham)

let followTheCompassSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                                                  CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                                  CocktailIngredient(.fortifiedWines(.amontillado), value: 0.25),
                                                  CocktailIngredient(.amari(.amaroMontenegro), value: 0.25),
                                                  CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                                  CocktailIngredient(.whiskies(.compassBoxOakCross), value: 1.25)]


let followTheCompassTags = Tags(profiles: [.floral, .spiritForward, .herbal],
                                styles: [.manhattan, .stirred])

