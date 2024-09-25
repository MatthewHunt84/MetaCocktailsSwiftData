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

let unusualSuspectSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.seasoning(.saline), value: 4, unit: .drops, prep: PrepBible.fiveToOneSaline),
                                                   OldCocktailIngredient(.otherNonAlc(.coconutWater), value: 1),
                                                   OldCocktailIngredient(.otherAlcohol(.burdockRootTincture), value:1, unit: .dashes),
                                                   OldCocktailIngredient(.liqueurs(.giffardBanane), value: 0.75),
                                                   OldCocktailIngredient(.fortifiedWines(.cocchiDeTorino), value: 0.75),
                                                   OldCocktailIngredient(.whiskies(.tullamoreDew), value: 1)]


let unusualSuspectTags = Tags(flavors: [.orange],
                              profiles: [.tropical, .nutty, .complex, .silky],
                              styles: [.stirred, .manhattan])
