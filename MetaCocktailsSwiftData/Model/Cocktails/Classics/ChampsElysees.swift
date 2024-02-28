//
//  ChampsElysees.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var champsElysees = Cocktail(cocktailName: "Champs Elysees",
                             glasswareType: .coupe,
                             garnish: [.lemonPeel],
                             ice: nil,
                             author: Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                             spec:champsElyseesSpec,
                             tags: champsElyseesTags)

var champsElyseesSpec  = [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          CocktailIngredient(.syrups(.simple), value: 0.25),
                          CocktailIngredient(.juices(.lemon), value: 0.75),
                          CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                          CocktailIngredient(.brandies(.cognacVSOP), value: 1.5)]



var champsElyseesTags = Tags(profiles: [.citrusy, .fruity, .tart, .light, .silky],
                             styles: [.sour, .shaken])

