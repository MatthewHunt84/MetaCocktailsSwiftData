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
                           author: Author(place: "Somewhere in America in the 1920s-ish."),
                           spec: grasshopperSpec,
                           tags: grasshopperTags,
                           variation: .grasshopper,
                           collection: .originals)

var grasshopperSpec = [CocktailIngredient(.otherNonAlc(.cream), value: 1),
                       CocktailIngredient(.liqueurs(.cremeDeCacao), value: 1),
                       CocktailIngredient(.liqueurs(.cremeDeMenthe), value: 1)]

var grasshopperTags = Tags(profiles: [.sweet, .rich, .savory],
                           styles: [ .shaken])


