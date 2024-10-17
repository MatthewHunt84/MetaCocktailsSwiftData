//
//  TreadLightly.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var treadLightly = Cocktail(cocktailName: "Tread Lightly",
                            glasswareType: .doubleOld,
                            garnish: [.lemonPeel],
                            ice: .bigRock,
                            author: Author(person: "Kenny Remster",
                                           place: AuthorPlaces.williamsAndGraham.rawValue,
                                           year: "2018"),
                            spec: treadLightlySpec,
                            tags: treadLightlyTags,
                            collection: .williamsAndGraham)

let treadLightlySpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                                 OldCocktailIngredient(.bitters(.peychauds), value: 3, unit: .dashes),
                                                 OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.25),
                                                 OldCocktailIngredient(.amari(.amaroMontenegro), value: 1),
                                                 OldCocktailIngredient(.brandies(.pFAmber), value: 1),
                                                 OldCocktailIngredient(.whiskies(.oGD114), value: 1)]


let treadLightlyTags = Tags(flavors: [.lemon],
                            profiles: [.bittersweet, .spiritForward, .complex],
                            styles: [.oldFashioned, .stirred])

