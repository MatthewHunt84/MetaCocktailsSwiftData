//
//  OldFashioned.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var oldFashioned = Cocktail(cocktailName: "Old Fashioned",
                            glasswareType: .doubleOld,
                            garnish: [.orangeOrLemon],
                            ice: .bigRock,
                            author:Author(place: "Too old to tell"),
                            spec: oldFashionedSpec,
                            tags: oldFashionedTags)

var oldFashionedSpec  =  [CocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon),
                          CocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                          CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

var oldFashionedTags = Tags( profiles: [.sweet],
                             textures: [.rich],
                             styles: [.oldFashioned, .stirred])

