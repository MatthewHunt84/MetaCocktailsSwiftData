//
//  ElChicicabra.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation

var elChicicabra = Cocktail(cocktailName: "El Chicicabra",
                            imageAsset: nil,
                            glasswareType: .doubleOld,
                            garnish: [.flamedOrange],
                            ice: .bigRock,
                            author: Author(place: AuthorPlaces.williamsAndGraham.rawValue),
                            spec: elChicicabraSpec,
                            tags: elChicicabraTags)

let elChicicabraSpec: [CocktailIngredient] = [CocktailIngredient(.liqueurs(.anchoVerde), value: 0.25),
                                              CocktailIngredient(.amari(.suze), value: 0.25),
                                              CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                                              CocktailIngredient(.amari(.aperol), value: 0.25),
                                              CocktailIngredient(.agaves(.mezcalDelMagueyChichicapa), value: 1.5)]


let elChicicabraTags = Tags(textures: [.light],
                            styles: [.sour, .shaken])

