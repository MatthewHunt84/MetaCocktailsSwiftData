//
//  pinaColadaDeathAndCo.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/14/24.
//

import Foundation

var pinaColadaDeathAndCo = Cocktail(cocktailName: "Piña Colada" + deathAndCoTitleTag,
                                    glasswareType: .tikiMug,
                                    garnish: [.mintSprig],
                                    ice: .pebbleIce,
                                    author:Author(person: nil,
                                                  place: AuthorPlaces.deathAndCo.rawValue,
                                                  year: nil),
                                    spec: pinaColadaSpecDeathAndCo,
                                    tags: pinaColadaTagsDeathAndCo,
                                    variation: .pinaColada,
                                    collection: .deathAndCo)

var pinaColadaSpecDeathAndCo  = [ OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                                  OldCocktailIngredient(.juices(.lime), value: 0.5),
                                  OldCocktailIngredient(.syrups(.cocoLopez), value: 1),
                                  OldCocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                                  OldCocktailIngredient(.rums(.rumWhite), value: 1),
                                  OldCocktailIngredient(.rums(.rumPuertoRican), value: 1)]

var pinaColadaTagsDeathAndCo = Tags(profiles: [.creamy, .tropical], styles: [.tiki, .shaken])

let deathAndCoTitleTag = " (Death & Co Version)"
