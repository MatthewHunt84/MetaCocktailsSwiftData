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

let followTheCompassSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                                  OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                                  OldCocktailIngredient(.fortifiedWines(.amontillado), value: 0.25),
                                                  OldCocktailIngredient(.amari(.amaroMontenegro), value: 0.25),
                                                  OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                                  OldCocktailIngredient(.whiskies(.compassBoxOakCross), value: 1.25)]


let followTheCompassTags = Tags(flavors: [.grapefruit],
                                profiles: [.floral, .spiritForward, .herbal],
                                styles: [.manhattan, .stirred])

