//
//  PrinceEdward.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation


var princeEdwardOG = Cocktail(cocktailName: "Prince Edward",
                              glasswareType: .coupe,
                              garnish: [.orangePeel],
                              author: stanJones,
                              spec: princeEdwardSpecOG,
                              tags: princeEdwardTagsOG,
                              variation: .princeEdward,
                              collection: .originals,
                              titleCocktail: true)

var princeEdwardSpecOG     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                               OldCocktailIngredient(.liqueurs(.drambuie), value: 0.5),
                               OldCocktailIngredient(.fortifiedWines(.lilletBlanc), value: 0.75),
                               OldCocktailIngredient(.whiskies(.scotchBlended), value: 2)]

var princeEdwardTagsOG    = Tags(flavors: [.orange, .bakingSpices],
                                 profiles: [.spiritForward, .sweet],
                                 styles: [.martini, .stirred])

