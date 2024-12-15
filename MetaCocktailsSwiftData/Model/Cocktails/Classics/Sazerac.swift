////
////  Sazerac.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var sazerac = Cocktail(cocktailName: "Sazerac",
                       glasswareType: .singleOld,
                       garnish: [.lemonPeel],
                       ice: nil,
                       author:Author(place: "Somewhere in New Orleans in", year: "1800s"),
                       spec: sazeracSpec,
                       buildOrder: sazeracBuild,
                       notes: sazeracNotes,
                       tags: sazeracTags,
                       variation: .sazerac,
                       collection: .originals,
                       titleCocktail: true)

var sazeracSpec  = [OldCocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon, prep: PrepBible.richDem),
                    OldCocktailIngredient(.brandies(.cognacVSOP), value: 2),
                    OldCocktailIngredient(.bitters(.peychauds), value: 4, unit: .dashes),
                    OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                    OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),]

var sazeracTags = Tags(flavors: [.lemon],
                       profiles: [.spiritForward, .punchy],
                       styles: [.oldFashioned, .stirred])


