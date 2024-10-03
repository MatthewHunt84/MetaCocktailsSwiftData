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
                            notes: aperolSpritzNotes,
                            tags: aperolSpritzTags)

var aperolSpritzSpec = [OldCocktailIngredient(.amari(.aperol), value: 2),
                        OldCocktailIngredient(.wines(.prosecco), value: 3),
                        OldCocktailIngredient(.soda(.sparklingWater), value: 1)]

var aperolSpritzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to the wine glass"),
                                             Instruction(step: 2, method: "Then add cubed Ice for less dilution and to retain its effervescence."),
                                             Instruction(step: 3, method: "Give a gentle stir and garnish with an orange twist.")])

var aperolSpritzTags = Tags(flavors: [.orange, .rhubarb, .grapefruit],
                            profiles: [.bittersweet, .refreshing, .effervescent],
                            styles: [.spritz, .built])

