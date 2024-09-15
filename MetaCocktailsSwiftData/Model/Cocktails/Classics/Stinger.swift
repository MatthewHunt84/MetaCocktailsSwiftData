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
                       notes: stingerBuild,
                       tags: stingerTags,
                       collection: .originals)

let stingerSpec  =  [OldCocktailIngredient(.liqueurs(.cremeDeMenthe), value: 0.75),
                     OldCocktailIngredient(.brandies(.cognacVSOP), value: 2.25)]

let stingerTags = Tags( profiles: [.sweet, .spiritForward],
                        styles: [.stirred])


let stingerBuild = "The combination of brandy and creme de menthe has been seen popping up in New York since the late 1880s. The 'Stinger' name wasn't attatched to it until the early 1910s. Is it technically a cocktail? Maybe it isn't. But we think it's at least worth a mention."
