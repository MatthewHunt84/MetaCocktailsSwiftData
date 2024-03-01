//
//  UnusualSuspect.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var unusualSuspect = Cocktail(cocktailName: "Unusual Suspect",
                              imageAsset: nil,
                              glasswareType: .doubleOld,
                              garnish: [.bloodOrangePeel],
                              ice: .bigRock,
                              author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                            place: AuthorPlaces.williamsAndGraham.rawValue,
                                            year: "2019"),
                              spec: unusualSuspectSpec,
                              tags: unusualSuspectTags,
                              collection: .williamsAndGraham)

let unusualSuspectSpec: [CocktailIngredient] = [CocktailIngredient(.seasoning(.saline), value: 4, unit: .drops),
                                                CocktailIngredient(.otherNonAlc(.coconutWater), value: 1),
                                                CocktailIngredient(.otherAlcohol(.burdockRootTincture), value:1, unit: .dash),
                                                CocktailIngredient(.liqueurs(.giffardBanane), value: 0.75),
                                                CocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75),
                                                CocktailIngredient(.whiskies(.tullamoreDew), value: 1)]


let unusualSuspectTags = Tags(profiles: [.tropical, .nutty, .complex, .silky],
                              styles: [.stirred, .manhattan])
