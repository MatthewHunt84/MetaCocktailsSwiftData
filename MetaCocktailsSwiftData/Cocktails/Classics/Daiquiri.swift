//
//  Daiquiri.swift
//  MetaCocktails
//
//  Created by Matt Hunt on 9/1/23.
//

import Foundation

let daiquiri = Cocktail(cocktailName: "Daiquiri", glasswareType: .coupe, garnish: [.limeWheel], spec: daiquiriSpec, tags: daiquiriTags)

var daiquiriSpec: [CocktailIngredient] = [CocktailIngredient(ingredient: .whiteRum, value: 2.0),
                                          CocktailIngredient(ingredient: .lime, value: 0.75),
                                          CocktailIngredient(ingredient: .simple, value: 0.75)]

var daiquiriTags = Tags(flavors: [.lime],
                profiles: [.citrusy],
                textures: [.light],
                styles: [.sour],
                bases: [.rum])
