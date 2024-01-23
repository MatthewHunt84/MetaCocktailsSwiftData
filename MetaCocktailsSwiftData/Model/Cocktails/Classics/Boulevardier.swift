////
////  Boulevardier.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var boulevardier  =  Cocktail(cocktailName: "Boulevardier",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author:Author(person: "Erskine Gwynne",place: "Paris", year: "1920's"),
                         spec: boulevardierSpec,
                         buildOrder: nil,
                         tags: boulevardierTags)

var boulevardierSpec = [CocktailIngredient(.whiskies(.straightRyeOrBourbon), value: 1),
                        CocktailIngredient(.fortifiedWines(.sweetVermouth), value: 1),
                        CocktailIngredient(.amari(.campari), value: 1)]

var boulevardierTags = Tags(flavors: [.orange, .bakingSpices],
                            profiles: [.bittersweet, .spiritForward],
                            textures: [.rich],
                            styles: [.negroni, .stirred])

