//
//  USSRussellPunch.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var uSSRussellPunch = Cocktail(cocktailName: "U.S.S. Russell Punch",
                               glasswareType: .punchBowl,
                               garnish: [.cinnamonSticksAndCloves],
                               ice: .oneLargeBlock,
                               author: Author(person: AuthorNames.sashaPetraske.rawValue,
                                              place: AuthorPlaces.milkAndHoney.rawValue,
                                              year: "Early 2000s"),
                               spec: uSSRussellPunchSpec,
                               buildOrder: uSSRussellPunchBuild,
                               tags: uSSRussellPunchTags,
                               variation: nil,
                               collection: .milkAndHoney,
                               titleCocktail: false)

var uSSRussellPunchSpec = [OldCocktailIngredient(.fruit(.lemons), value: 50, unit: .whole),
                           OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1360, unit: .grams),
                           OldCocktailIngredient(.otherNonAlc(.nutmegGrated), value: 1, unit: .tablespoon),
                           OldCocktailIngredient(.rums(.appletonEstateSignatureBlend), value: 3, unit: .bottles),
                           OldCocktailIngredient(.rums(.rumDark), value: 3, unit: .bottles),
                           OldCocktailIngredient(.rums(.rumWhite), value: 3, unit: .bottles),
                           OldCocktailIngredient(.wines(.prosecco), value: 6, unit: .bottles) ]

var uSSRussellPunchTags = Tags(flavors: [.nutmeg, .clove, .cinnamon], profiles: [.aromatic, .refreshing, .citrusy, .effervescent],
                               styles: [.built])


