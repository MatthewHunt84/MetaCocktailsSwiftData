//
//  Boulevardier.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var boulevardier  =  Cocktail(cocktailName: "Boulevardier",
                         glasswareType: Glassware.doubleOld,
                         garnish: [.orangePeel],
                         ice: .bigRock,
                         author: "Erskine Gwynne (1920s)",
                         spec: boulevardierSpec,
                         buildOrder: nil,
                         tags: boulevardierTags)

var boulevardierSpec = [CocktailIngredient(.straightRyeOrBourbon, value: 1),
                   CocktailIngredient(.sweetVermouth, value: 1),
                   CocktailIngredient(.campari, value: 1)]

var boulevardierTags = Tags(flavors: [.orange, .bakingSpices],
                       profiles: [.bittersweet],
                       textures: [.rich],
                       styles: [.negroni, .stirred],
                       bases: [.straightRyeOrBourbon])
