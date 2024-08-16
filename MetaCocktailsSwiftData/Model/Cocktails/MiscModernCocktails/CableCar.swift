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

var cableCarSpec  = [OldCocktailIngredient(.juices(.lemon), value: 1),
                     OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 0.75),
                     OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                     OldCocktailIngredient(.rums(.captainMorgan), value:1.5)]

var cableCarTags = Tags(flavors: [.cinnamon],
                        profiles: [.citrusy, .fruity, .light],
                        styles: [.sour, .shaken])

