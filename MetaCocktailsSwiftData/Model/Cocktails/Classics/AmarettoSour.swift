//
//  AmarettoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var amarettoSour  = Cocktail(cocktailName: "Amaretto Sour",
                             glasswareType: .martini,
                             garnish: [.maraschinoCherry],
                             spec: amarettoSourSpec,
                             tags: amarettoSourTags,
                             variation: .amarettoSour,
                             titleCocktail: true)

var amarettoSourSpec  = [CocktailIngredient(.syrups(.simple), value: 0.75),
                         CocktailIngredient(.juices(.lemon), value: 0.75),
                         CocktailIngredient(.liqueurs(.amaretto) , value: 2)]



var amarettoSourTags   = Tags(profiles: [.citrusy, .sweet],
                              styles: [.shaken, .sour])

