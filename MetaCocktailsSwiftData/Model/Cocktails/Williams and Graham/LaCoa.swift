//
//  LaCoa.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var laCoa = Cocktail(cocktailName: "La Coa",
                     glasswareType: .doubleOld,
                     garnish: [.orangePeel],
                     ice: .bigRock,
                     author: Author(person: AuthorNames.justinJenkins.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                     spec: laCoaSpec,
                     tags: laCoaTags,
                     collection: .williamsAndGraham)

let laCoaSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                                          OldCocktailIngredient(.rums(.cruzanBlackstrap), value: 2, unit: .barSpoon),
                                          OldCocktailIngredient(.liqueurs(.giffardPassion), value: 0.25),
                                          OldCocktailIngredient(.amari(.angosturaAmaro), value: 0.5),
                                          OldCocktailIngredient(.brandies(.boulardCalvados), value: 0.5),
                                          OldCocktailIngredient(.agaves(.mezcalDelMagueyJabali), value: 1, unit: .whole)]


let laCoaTags = Tags(flavors: [.orange],
                     profiles: [.punchy, .spiritForward, .complex, .fruity, .smokey],
                     styles: [.stirred, .oldFashioned, .tiki])

