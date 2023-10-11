//
//  AperolSpritz.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/26/23.
//

import SwiftUI


var aperolSpritz = Cocktail(name: "Aperol Spritz",
                            imageName: Image(.emptyCocktail),
                            background: Color.brandPrimaryOrange,
                            glasswareType: Glassware.wineGlass,
                            garnish: [GarnishCatalog.orangePeel.asset],
                            ice: Ingredient.koldDraft,
                            author: nil,
                            spec: aperolSpritzSpec,
                            buildOrder: aperolSpritzBuild,
                            tags: aperolSpritzTags)

var aperolSpritzSpec = [CocktailIngredient(name: Ingredient.aperol, value: 2, unit: .fluidOunces),
                        CocktailIngredient(name: Ingredient.prosecco, value: 3, unit: .fluidOunces),
                        CocktailIngredient(name: Ingredient.sparklingWater, value: 1, unit: .fluidOunces)]


var aperolSpritzBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients to the wine glass"), 
                                             Instruction(step: 2, method: "Add cubed Ice for less dilution to retain its effervescence."),
                                             Instruction(step: 3, method: "Give a gentle stir and garnish with an extra long orange peel")])


var aperolSpritzTags = Tags(flavors: [.grapefruit, .rhubarb, .orange],
                            textures: [.effervescent],
                            styles: [.spritz, .built],
                            baseComponents: [.aperol])
