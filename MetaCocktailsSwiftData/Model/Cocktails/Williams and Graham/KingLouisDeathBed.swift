//
//  KingLouisDeathBed.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation


var kingLouisDeathBed = Cocktail(cocktailName: "King Louis Death Bed",
                                 imageAsset: nil,
                                 glasswareType: .stemmedGlassware,
                                 garnish: [.lemonPeel],
                                 ice: nil,
                                 author: Author(person: "Matt Hunt",
                                                place: AuthorPlaces.williamsAndGraham.rawValue,
                                                year: "2021"),
                                 spec: kingLouisDeathBedSpec,
                                 tags: kingLouisDeathBedTags)

let kingLouisDeathBedSpec: [CocktailIngredient] = [CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.25),
                                                   CocktailIngredient(.liqueurs(.traderVicsChestnut), value: 0.5),
                                                   CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                                   CocktailIngredient(.vodkas(.zubrowka), value: 1),
                                                   CocktailIngredient(.brandies(.clearCreekPearBrandy), value: 1.5)]


let kingLouisDeathBedTags = Tags(profiles: [.bright, .spiritForward, .complex, .fruity, .sophisticated],
                                 styles: [.martini, .stirred])

