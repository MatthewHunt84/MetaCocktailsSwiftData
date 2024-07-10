//
//  Left Hand.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation

var leftHand = Cocktail(cocktailName: "Left Hand",
                          glasswareType: .coupe,
                          garnish: [.maraschinoCherry],
                          ice: nil,
                          author:Author(person: AuthorNames.samRoss.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                          spec: leftHandSpec,
                          buildOrder: nil,
                          tags: leftHandTags,
                          collection: .milkAndHoney)

var leftHandSpec     =  [OldCocktailIngredient(.bitters(.bittermansChocolate), value: 3, unit: .dashes),
                         OldCocktailIngredient(.amari(.campari), value: 0.75, unit: .barSpoon),
                         OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                         OldCocktailIngredient(.whiskies(.bourbonAny), value: 1.5)]

var leftHandTags     = Tags(profiles: [.spiritForward, .bittersweet, .complex],
                              styles: [.negroni, .stirred])
