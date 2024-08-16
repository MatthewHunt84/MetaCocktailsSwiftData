//
//  TheGreatGazoo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/2/24.
//

import Foundation

var theGreatGazoo = Cocktail(cocktailName: "The Great Gazoo",
                             imageAsset: nil,
                             glasswareType: .doubleOld,
                             garnish: [.angoDeco],
                             ice: .bigRock,
                             author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: theGreatGazooSpec,
                             tags: theGreatGazooTags,
                             collection: .williamsAndGraham)

let theGreatGazooSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                                  OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5, prep: PrepBible.demSyrupPrep),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                                  OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                                  OldCocktailIngredient(.liqueurs(.stGeorgeSpicesPear), value: 0.5),
                                                  OldCocktailIngredient(.whiskies(.woodyCreekRye), value:1.5)]


let theGreatGazooTags = Tags(profiles: [.refreshing, .fruity],
                             styles: [.sour, .shaken])

