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

let theGreatGazooSpec: [CocktailIngredient] = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                               CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                                               CocktailIngredient(.juices(.lemon), value: 0.5),
                                               CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                               CocktailIngredient(.liqueurs(.stGeorgeSpicesPear), value: 0.5),
                                               CocktailIngredient(.whiskies(.woodyCreekRye), value:1.5)]


let theGreatGazooTags = Tags(profiles: [.refreshing, .fruity],
                             styles: [.sour, .shaken])

