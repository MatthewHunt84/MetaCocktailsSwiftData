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

let amarettoSourNotes = "The Amaretto Sour was first introduced to the public in 1974 by the importer of Amaretto di Saronno. The original recipe called for a ratio of 1.5 oz (45 ml) of Amaretto to 3 oz (90 ml) of sour mix, without the inclusion of egg whites or bitters. This formulation tends to produce a notably sweet cocktail. However, we believe the natural sweetness of the liqueur itself is sufficient to balance the drink. Our approach is to use 1 oz of fresh lemon juice to complement the Amaretto's sweetness, especially when incorporating egg whites. For those who prefer to omit the egg whites, we recommend to reduce the lemon juice to 0.75 oz and adjust the sweetness to taste. A good starting point is to add 0.25 oz of simple syrup, increasing or decreasing as needed to achieve the desired balance."
