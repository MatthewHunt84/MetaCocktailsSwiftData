//
//  Here be Dragons.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var hereBeDragons = Cocktail(cocktailName: "Here Be Dragons",
                             imageAsset: nil,
                             glasswareType: .tikiMug,
                             garnish: [.mintBouquet, .flamingLimeBoat],
                             author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: hereBeDragonsSpec,
                             tags: hereBeDragonsTags,
                             collection: .williamsAndGraham)

let hereBeDragonsSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.grenadine), value: 0.25),
                                               OldCocktailIngredient(.juices(.grapefruit), value: 0.5),
                                               OldCocktailIngredient(.juices(.lime), value: 1),
                                               OldCocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75),
                                               OldCocktailIngredient(.liqueurs(.anchoVerde), value: 0.5),
                                               OldCocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]


let hereBeDragonsTags = Tags(profiles: [.light, .fruity, .spicy],
                             styles: [.sour, .shaken, .tiki])
