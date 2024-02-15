//
//  AcquitYourQuest.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var acquitYourQuest = Cocktail(cocktailName: "Acquit Your Quest",
                               glasswareType: .doubleOld,
                               garnish: [.flamedOrange],
                               ice: .bigRock,
                               author: Author(person: AuthorNames.kennyRemster.rawValue,
                                              place: AuthorPlaces.williamsAndGraham.rawValue,
                                              year: "2018"),
                               spec: acquitYourQuestSpec,
                               tags: acquitYourQuestTags,
                               collection: .williamsAndGraham)

var acquitYourQuestSpec  = [CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                            CocktailIngredient(.amari(.amaroNonino), value: 0.5),
                            CocktailIngredient(.amari(.amaroMontenegro), value: 0.5),
                            CocktailIngredient(.brandies(.lairdsBonded), value: 0.5),
                            CocktailIngredient(.brandies(.boulardCalvados), value: 1.5)]

var acquitYourQuestTags = Tags(profiles: [.bittersweet, .complex, .punchy, .fruity],
                               styles: [.manhattan, .stirred])
