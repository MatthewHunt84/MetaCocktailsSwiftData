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
                            buildOrder:
                            aperolSpritzBuild,
                            tags: aperolSpritzTags)


var aperolSpritzSpec = [CocktailIngredient(.aperol, value: 2),
                        CocktailIngredient(.prosecco, value: 3),
                        CocktailIngredient(.sparklingWater, value: 1)]


var aperolSpritzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to the wine glass"),
                                             Instruction(step: 2, method: "Add cubed Ice for less dilution to retain its effervescence."),
                                             Instruction(step: 3, method: "Give a gentle stir and garnish with an extra long orange peel")])


var aperolSpritzTags = Tags(flavors: [.orange, .rhubarb, .grapefruit],
                            profiles: [.bitter],
                            textures: [.effervescent],
                            styles: [.spritz, .built],
                            amari: [.aperol],
                            wine: [.prosecco])
                        
