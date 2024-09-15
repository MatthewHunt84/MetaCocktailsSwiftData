//
//  OldFashioned.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

let oldFashioned = Cocktail(cocktailName: "Old Fashioned",
                            glasswareType: .doubleOld,
                            garnish: [.orangeOrLemon],
                            ice: .bigRock,
                            author: Author(place: "Too old to tell"),
                            spec: oldFashionedSpec,
                            notes: oldFashionedBuild,
                            tags: oldFashionedTags,
                            variation: .oldFashioned,
                            titleCocktail: true)

let oldFashionedSpec  =  [OldCocktailIngredient(.syrups(.richDem), value: 2, unit: .teaspoon, prep: PrepBible.richDem),
                          OldCocktailIngredient(.bitters(.angosturaBitters), value: 3, unit: .dashes),
                          OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 2)]

let oldFashionedTags = Tags( profiles: [.bittersweet, .spiritForward],
                             styles: [.oldFashioned, .stirred])


let oldFashionedBuild = "This is a more modern version that you'll find at upscale cocktail bars. This is also our prefered version of the Old Fashioned. Making a rich dem adds texture to the cocktail and also has the added benifit of fully emulsifying. A sugar cube does not."
