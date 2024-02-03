//
//  DontPanic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var dontPanic = Cocktail(cocktailName: "Don't Panic",
                         imageAsset: nil,
                         glasswareType: .collins,
                         garnish: [.mintSprig],
                         ice: .columnIce,
                         author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2022"),
                         spec: dontPanicSpec,
                         tags: dontPanicTags)

let dontPanicSpec: [CocktailIngredient] = [CocktailIngredient(.soda(.sodaWater), value: 1),
                                           CocktailIngredient(.juices(.lemon), value: 0.5),
                                           CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                                           CocktailIngredient(.liqueurs(.aelredMelonApertif), value: 1),
                                           CocktailIngredient(.amari(.fernetBranca), value: 1)]


let dontPanicTags = Tags(profiles: [.refreshing, .citrusy, .herbal, .rich, .fruity, .complex],
                         styles: [.fizz, .shaken])

