//
//  CardiC.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var cardiC = Cocktail(cocktailName: "Cardi C",
                      imageAsset: nil,
                      glasswareType: .singleOld,
                      garnish: [.orangePeel],
                      ice: nil,
                      author: Author(person: "Jimmy Kenyon",
                                     place: AuthorPlaces.williamsAndGraham.rawValue,
                                     year: "2020"),
                      spec: cardiCSpec,
                      tags: cardiCTags,
                      collection: .williamsAndGraham)

let cardiCSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.bitters(.chocolateMole), value: 8, unit: .drops),
                                           OldCocktailIngredient(.amari(.sfumato), value: 0.25),
                                           OldCocktailIngredient(.amari(.cardamaro), value: 1.5),
                                           OldCocktailIngredient(.agaves(.mezcalDelMagueyChichicapa), value: 1.5)]


let cardiCTags = Tags(flavors: [.orange],
                      profiles: [.spiritForward, .rich, .smokey, .bittersweet],
                      styles: [.stirred])

