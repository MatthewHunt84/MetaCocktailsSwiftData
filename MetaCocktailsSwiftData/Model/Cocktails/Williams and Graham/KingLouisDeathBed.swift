//
//  KingLouisDeathBed.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var kingLouisDeathBed = Cocktail(cocktailName: "King Louis Death Bed",
                                 glasswareType: .stemmedGlassware,
                                 garnish: [.lemonPeel],
                                 ice: nil,
                                 author: Author(person: "Matt Hunt",
                                                place: AuthorPlaces.williamsAndGraham.rawValue,
                                                year: "2021"),
                                 spec: kingLouisDeathBedSpec,
                                 tags: kingLouisDeathBedTags,
                                 collection: .williamsAndGraham)

let kingLouisDeathBedSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                                      OldCocktailIngredient(.liqueurs(.traderVicsChestnut), value: 0.5),
                                                      OldCocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                                      OldCocktailIngredient(.vodkas(.zubrowka), value: 1),
                                                      OldCocktailIngredient(.brandies(.clearCreekPearBrandy), value: 1.5)]


let kingLouisDeathBedTags = Tags(flavors: [.lemon],
                                 profiles: [.spiritForward, .complex, .fruity, .nutty],
                                 styles: [.martini, .stirred])

