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


var aperolSpritzNotes = "Aperol was introduced to the market in 1919, initially enjoyed primarily with soda water. Around the mid-20th century, this bitter liqueur found its way into the classic Italian spritz, enhancing the popular drink with the addition of sparkling wine. A significant turning point came in 2003 when the Campari company acquired Aperol. They launched a highly effective advertising campaign that dramatically increased the drink's global popularity. As a result of this marketing success, the Aperol Spritz has become a universally recognized cocktail."
