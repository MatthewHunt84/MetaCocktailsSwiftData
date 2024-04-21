//
//  TalentScout.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 4/15/24.
//

import Foundation

var talentScout = Cocktail(cocktailName: "Talent Scout",
                           glasswareType: .doubleOld,
                           garnish: [.lemonPeel],
                           ice: .bigRock,
                           author: Author(person: AuthorNames.tedSaucier.rawValue, place: AuthorPlaces.bottomsUp.rawValue, year: "1951"),
                           spec: talentScoutSpec,
                           tags: talentScoutTagsD,
                           variation: nil,
                           titleCocktail: true)

var talentScoutSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 2),
                            CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                            CocktailIngredient(.whiskies(.straightBourbon), value: 2.25)]

var talentScoutTagsD     = Tags(profiles: [.spiritForward, .bittersweet, .fruity],
                               styles: [.oldFashioned, .stirred])

