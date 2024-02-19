//
//  Grasshopper.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var grasshopper = Cocktail(cocktailName: "Grasshopper",
                           imageAsset: nil,
                           glasswareType: .coupe,
                           garnish: [.noGarnish],
                           ice: nil,
                           author: Author(place: "Too old to tell."),
                           spec: grasshopperSpec,
                           tags: grasshopperTags,
                           variation: .grasshopper)

var grasshopperSpec = [CocktailIngredient(.otherNonAlc(.cream), value: 1),
                       CocktailIngredient(.liqueurs(.cremeDeCacao), value: 1),
                       CocktailIngredient(.liqueurs(.cremeDeMenthe), value: 1)]

var grasshopperTags = Tags(profiles: [.sweet, .rich, .savory],
                           styles: [ .shaken])


