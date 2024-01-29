//
//  CableCar.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation


var cableCar = Cocktail(cocktailName: "Cable Car",
                        glasswareType: .cinnamonSugarRim,
                        garnish: [.orangePeel],
                        author: Author(person: "Tony Abou-Ganim", place:  "Starlight Room, San Francisco", year: "1996"),
                        spec: cableCarSpec,
                        tags: cableCarTags)

var cableCarSpec  = [CocktailIngredient(.juices(.lemon), value: 1),
                     CocktailIngredient(.liqueurs(.orangeCuracao), value: 0.75),
                     CocktailIngredient(.syrups(.simple), value: 0.5),
                     CocktailIngredient(.rums(.captainMorgan), value:1.5)]

var cableCarTags = Tags(flavors: [.cinnamon],
                        profiles: [.citrusy, .fruity],
                        textures: [.light],
                        styles: [.sour, .shaken])

