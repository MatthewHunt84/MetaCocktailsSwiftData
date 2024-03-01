//
//  NorthernDutchess.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var northernDuchess = Cocktail(cocktailName: "Northern Duchess",
                               glasswareType: .nickAndNora,
                               garnish: [.flamedLemon],
                               ice: nil,
                               author: Author(person: AuthorNames.kennyRemster.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                               spec: northernDuchessSpec,
                               tags: northernDuchessTags,
                               collection: .williamsAndGraham)

var northernDuchessSpec  = [CocktailIngredient(.syrups(.demSyrupOneToOne), value: 1, unit: .barSpoon),
                            CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                            CocktailIngredient(.liqueurs(.strega), value: 0.25),
                            CocktailIngredient(.otherAlcohol(.linieAquavit), value: 0.5),
                            CocktailIngredient(.otherAlcohol(.trakal), value: 0.25),
                            CocktailIngredient(.gins(.agedBolsGenever), value: 1.5)]

var northernDuchessTags = Tags(profiles: [.complex, .punchy],
                               styles: [.oldFashioned, .stirred])
