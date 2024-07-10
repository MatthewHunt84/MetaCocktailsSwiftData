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

var champsElyseesSpec  = [OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                          OldCocktailIngredient(.syrups(.simple), value: 0.25),
                          OldCocktailIngredient(.juices(.lemon), value: 0.75),
                          OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                          OldCocktailIngredient(.brandies(.cognacVSOP), value: 1.5)]



var champsElyseesTags = Tags(profiles: [.citrusy, .fruity, .tart, .light, .silky],
                             styles: [.sour, .shaken])

