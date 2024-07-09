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

let hereBeDragonsSpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.grenadine), value: 0.25, info: Syrup.grenadine.grenadineInfo),
                                               CocktailIngredient(.juices(.grapefruit), value: 0.5),
                                               CocktailIngredient(.juices(.lime), value: 1),
                                               CocktailIngredient(.syrups(.passionfruitSyrup), value: 0.75),
                                               CocktailIngredient(.liqueurs(.anchoVerde), value: 0.5),
                                               CocktailIngredient(.agaves(.mezcalDelMagueyVida), value: 1.5)]


let hereBeDragonsTags = Tags(profiles: [.light, .fruity, .spicy],
                             styles: [.sour, .shaken, .tiki])
