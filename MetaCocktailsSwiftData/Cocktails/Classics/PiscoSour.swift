//
//  PiscoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/24/23.
//

import SwiftUI

var piscoSour = Cocktail(cocktailName: "Pisco Sour",
                        glasswareType: .stemmedGlassware,
                        ice: nil,
                        author: "Peru or Chile (We'll let them fight it out)",
                        spec: piscoSourSpec,
                        buildOrder: piscoSourBuild,
                        tags: piscoSourTags)

var piscoSourSpec  = [CocktailIngredient(.lime, value: 0.75),
                     CocktailIngredient(.simple, value: 0.75),
                     CocktailIngredient(.eggWhites, value: 0.75),
                      CocktailIngredient(.pisco, value: 0.75),
                      CocktailIngredient(.angosturaBitters, value: 2, unit: .dashes)]

var piscoSourBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients accept for the bitters into a tin a dry shake to emulsify"),
                                          Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold. Do not over dilute"),
                                          Instruction(step: 3, method: "Immediately after shaking (with vigor), pop the tin and double strain very carefully into a stemmed glass. Create the least amount of turbulence here so that you create a smooth and even surface for the design with the bitters."),
                                          Instruction(step: 4, method: "Wait about 30 seconds after you stain out the cocktail to make the design over the top. It helps for the egg whites to settle for a bit to give you a better and more even canvas to work with.")])


var piscoSourTags = Tags(textures: [.light, .silky],
                         styles: [.sour, .shaken],
                        bases: [.pisco])
