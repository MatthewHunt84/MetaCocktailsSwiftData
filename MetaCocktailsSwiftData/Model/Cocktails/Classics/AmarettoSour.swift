//
//  AmarettoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var amarettoSour  = Cocktail(cocktailName: "Amaretto Sour",
                             glasswareType: .martini,
                             garnish: [.maraschinoCherry, .angoDeco],
                             spec: amarettoSourSpec,
                             notes: amarettoSourNotes,
                             tags: amarettoSourTags,
                             variation: .amarettoSour,
                             titleCocktail: true)

var amarettoSourSpec  = [OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                         OldCocktailIngredient(.juices(.lemon), value: 1),
                         OldCocktailIngredient(.liqueurs(.amaretto) , value: 2)]



var amarettoSourTags   = Tags(profiles: [.citrusy, .sweet, .silky],
                              styles: [.shaken, .sour])
