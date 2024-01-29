//
//  AperolSpritz.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 10/12/23.
//

import SwiftUI

var aperolSpritz = Cocktail(cocktailName: "Aperol Spritz",
                            glasswareType: .wineGlass,
                            garnish: [.halfOrangeWheel],
                            ice: .koldDraft,
                            author: nil,
                            spec: aperolSpritzSpec,
                            buildOrder:
                            aperolSpritzBuild,
                            tags: aperolSpritzTags)

var aperolSpritzSpec = [CocktailIngredient(.amari(.aperol), value: 2),
                        CocktailIngredient(.wines(.prosecco), value: 3),
                        CocktailIngredient(.soda(.sparklingWater), value: 1)]

var aperolSpritzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to the wine glass"),
                                             Instruction(step: 2, method: "Add cubed Ice for less dilution to retain its effervescence."),
                                             Instruction(step: 3, method: "Give a gentle stir and garnish with an orange half-moon.")])

var aperolSpritzTags = Tags(flavors: [.orange, .rhubarb, .grapefruit],
                            profiles: [.bittersweet, .refreshing, .effervescent],
                            styles: [.spritz, .built])

                        
