//
//  TalentSout.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation

var talentScout = Cocktail(cocktailName: "Talent Scout",
                           glasswareType: .doubleOld,
                           garnish: [.lemonPeel],
                           ice: .bigRock,
                           author: Author(person: AuthorNames.tedSaucier.rawValue,
                                          place: "Bottoms Up",
                                          year: "1951"),
                           spec: talentScoutSpec,
                           tags: talentScoutTags,
                           collection: .originals)

var talentScoutSpec     =  [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                            OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                            OldCocktailIngredient(.whiskies(.bourbonOverproof), value: 2.25)]

var talentScoutTags     = Tags(flavors: [.lemon],
                               profiles: [.spiritForward, .fruity, .punchy],
                               styles: [.oldFashioned, .stirred])

