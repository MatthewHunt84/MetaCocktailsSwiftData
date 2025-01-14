//
//  AperolSpritz.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/12/23.
//

import SwiftUI

var aperolSpritz = Cocktail(cocktailName: "Aperol Spritz",
                            glasswareType: .wineGlass,
                            garnish: [.orangePeel],
                            ice: .koldDraft,
                            author: nil,
                            spec: aperolSpritzSpec,
                            buildOrder: aperolSpritzBuild,
                            notes: aperolSpritzNote,
                            tags: aperolSpritzTags)

var aperolSpritzSpec = [OldCocktailIngredient(.amari(.aperol), value: 2),
                        OldCocktailIngredient(.wines(.prosecco), value: 3),
                        OldCocktailIngredient(.soda(.sparklingWater), value: 1)]



var aperolSpritzTags = Tags(flavors: [.orange, .rhubarb, .grapefruit],
                            profiles: [.bittersweet, .refreshing, .effervescent],
                            styles: [.spritz, .built])

