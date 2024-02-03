//
//  LaCoa.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var laCoa = Cocktail(cocktailName: "La Coa",
                     imageAsset: nil,
                     glasswareType: .doubleOld,
                     garnish: [.orangePeel],
                     ice: .bigRock,
                     author: Author(person: "", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Spring, 2022"),
                     spec: laCoaSpec,
                     tags: laCoaTags)

let laCoaSpec: [CocktailIngredient] = [CocktailIngredient(.bitters(.chocolateMole), value: 2, unit: .dashes),
                                       CocktailIngredient(.rums(.cruzanBlackstrap), value: 2, unit: .barSpoons),
                                       CocktailIngredient(.liqueurs(.giffardPassion), value: 0.25),
                                       CocktailIngredient(.amari(.angosturaAmaro), value: 0.5),
                                       CocktailIngredient(.brandies(.boulardCalvados), value: 0.5),
                                       CocktailIngredient(.agaves(.mezcalDelMagueyJabali), value: 1, unit: .whole)]


let laCoaTags = Tags(profiles: [.punchy, .spiritForward, .complex, .fruity, .smokey],
                     styles: [.stirred, .oldFashioned, .tiki])

