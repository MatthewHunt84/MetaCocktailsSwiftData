//
//  HollandHouseKappelers.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hollandHouseKappeler = Cocktail(cocktailName: "Holland House (Kappeler's)",
                                    glasswareType: .stemmedGlassware,
                                    garnish: [.orangePeel],
                                    ice: nil,
                                    author:Author(person: "George J. Kappeler", place: "Modern American Drinks: How to Mix and Serve All Kinds of Cups and Drinks.", year: "1895"),
                                    spec: hollandHouseKappelerSpec,
                                    tags: hollandHouseKappelerTags)
var hollandHouseKappelerSpec  =  [CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                  CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.5),
                                  CocktailIngredient(.whiskies(.straightRye), value: 2)]

var hollandHouseKappelerTags = Tags( profiles: [.fruity, .spiritForward],
                                     styles: [.oldFashioned, .stirred])
