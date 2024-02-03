//
//  MidnightInMichoacan.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation

var midnightInMichoacan = Cocktail(cocktailName: "Midnight In Michoacan",
                                   glasswareType: .coupe,
                                   garnish: [.dehydratedOrangeBlack],
                                   ice: nil,
                                   author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "Summer, 2022"),
                                   spec: midnightInMichoacanSpec,
                                   tags: midnightInMichoacanTags)

var midnightInMichoacanSpec  = [CocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                                CocktailIngredient(.liqueurs(.nocino), value: 1),
                                CocktailIngredient(.rums(.uruapanAnejo), value: 1.5)]

var midnightInMichoacanTags = Tags(profiles: [.complex, .punchy, .funky],
                                   styles: [.martini, .stirred])
