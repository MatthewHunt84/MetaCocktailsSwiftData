////
////  Boulevardier.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var boulevardier  =  Cocktail(cocktailName: "Boulevardier",
                              glasswareType: .doubleOld,
                              garnish: [.orangePeel],
                              ice: .bigRock,
                              author:Author(person: "Erskine Gwynne",place: "Paris", year: "1920's"),
                              spec: boulevardierSpec,
                              buildOrder: nil,
                              tags: boulevardierTags,
                              variation: .boulevardier,
                              collection: .originals,
                              titleCocktail: true)

var boulevardierSpec = [OldCocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1.25),
                        OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                        OldCocktailIngredient(.amari(.campari), value: 1)]

var boulevardierTags = Tags(flavors: [.orange, .bakingSpices],
                            profiles: [.bittersweet, .spiritForward, .rich],
                            styles: [.negroni, .stirred])

