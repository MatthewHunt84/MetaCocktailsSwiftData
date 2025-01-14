//
//  Stinger.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation


let stinger = Cocktail(cocktailName: "Stinger",
                       glasswareType: .doubleOld,
                       garnish: [.orangeOrLemon],
                       ice: .pebbleIce,
                       author: Author(place: "Manhattan", year: "1880s"),
                       spec: stingerSpec,
                       notes: stingerNote,
                       tags: stingerTags)

let stingerSpec  =  [OldCocktailIngredient(.liqueurs(.cremeDeMenthe), value: 0.75),
                     OldCocktailIngredient(.brandies(.cognacVSOP), value: 2.25)]

let stingerTags = Tags( profiles: [.sweet, .spiritForward],
                        styles: [.stirred])

