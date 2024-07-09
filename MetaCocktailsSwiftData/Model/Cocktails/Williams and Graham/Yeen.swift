//
//  Yeen.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var yeen = Cocktail(cocktailName: "Yeen.",
                    imageAsset: nil,
                    glasswareType: .doubleOld,
                    garnish: [.lemonPeel],
                    ice: .bigRock,
                    author:Author(person: "",
                                  place: AuthorPlaces.williamsAndGraham.rawValue,
                                  year: "Spring, 2022"),
                    spec: yeenSpec,
                    tags: yeenTags,
                    collection: .williamsAndGraham)

let yeenSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.rums(.rumFire), value: 0.25),
                                         OldCocktailIngredient(.rums(.plantationOFTD), value: 0.75),
                                         OldCocktailIngredient(.fortifiedWines(.bonal), value: 0.75),
                                         OldCocktailIngredient(.liqueurs(.giffardPassion), value: 0.75),
                                         OldCocktailIngredient(.amari(.sfumato), value: 0.75)]


let yeenTags = Tags(profiles: [.herbal, .fruity, .punchy, .spiritForward],
                    styles: [.stirred, .oldFashioned, .tiki])
