//
//  Grasshopper.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var grasshopper = Cocktail(cocktailName: "Grasshopper",
                           glasswareType: .coupe,
                           garnish: [.noGarnish],
                           ice: nil,
                           author: Author(place: "Somewhere in America in the 1920s-ish."),
                           spec: grasshopperSpec,
                           tags: grasshopperTags,
                           variation: .grasshopper,
                           titleCocktail: true)

var grasshopperSpec = [OldCocktailIngredient(.otherNonAlc(.cream), value: 1),
                       OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 1),
                       OldCocktailIngredient(.liqueurs(.cremeDeMenthe), value: 1)]

var grasshopperTags = Tags(profiles: [.sweet, .rich, .savory],
                           styles: [ .shaken])


