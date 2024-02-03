//
//  TreadLightly.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var treadLightly = Cocktail(cocktailName: "Tread Lightly",
                           imageAsset: nil,
                           glasswareType: .doubleOld,
                           garnish: [.lemonPeel],
                           ice: .bigRock,
                           author: Author(person: "Kenny Remster",
                                          place: AuthorPlaces.williamsAndGraham.rawValue,
                                          year: "2018"),
                           spec: treadLightlySpec,
                           tags: treadLightlyTags)

let treadLightlySpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                             CocktailIngredient(.bitters(.peychauds), value: 3, unit: .dashes),
                                             CocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.25),
                                             CocktailIngredient(.amari(.amaroMontenegro), value: 1),
                                             CocktailIngredient(.brandies(.pFAmber), value: 1),
                                             CocktailIngredient(.whiskies(.oGD114), value: 1)]


let treadLightlyTags = Tags(profiles: [.bittersweet, .spiritForward, .complex],
                           styles: [.oldFashioned, .stirred])

