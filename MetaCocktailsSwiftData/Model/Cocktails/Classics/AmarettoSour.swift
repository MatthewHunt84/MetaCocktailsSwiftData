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

var amarettoSourSpec  = [OldCocktailIngredient(.syrups(.simple), value: 0.75),
                         OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.liqueurs(.amaretto) , value: 2)]



var amarettoSourTags   = Tags(profiles: [.citrusy, .sweet],
                              styles: [.shaken, .sour])

