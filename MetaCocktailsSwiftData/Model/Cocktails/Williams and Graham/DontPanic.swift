//
//  DontPanic.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/3/24.
//

import Foundation


var dontPanic = Cocktail(cocktailName: "Don't Panic",
                         glasswareType: .collins,
                         garnish: [.mintSprig],
                         ice: .columnIce,
                         author: Author(person: "Justin Jenkins", place: AuthorPlaces.williamsAndGraham.rawValue, year: "Fall, 2022"),
                         spec: dontPanicSpec,
                         tags: dontPanicTags,
                         collection: .williamsAndGraham)

let dontPanicSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.soda(.sodaWater), value: 1),
                                              OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                              OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5, prep: PrepBible.demSyrupPrep),
                                              OldCocktailIngredient(.liqueurs(.aelredMelonApertif), value: 1),
                                              OldCocktailIngredient(.amari(.fernetBranca), value: 1)]


let dontPanicTags = Tags(flavors: [.mint],
                         profiles: [.refreshing, .citrusy, .herbal, .rich, .fruity, .complex],
                         styles: [.fizz, .shaken])

