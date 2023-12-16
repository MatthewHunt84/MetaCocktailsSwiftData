//
//  QueensParkSwizzle.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/5/23.
//

import SwiftUI



var queensParkSwizzle = Cocktail(cocktailName: "Queens Park Swizzle",
                                 glasswareType: .collins,
                                 garnish: [.mintBouquet],
                                 ice: .pebbleIce,
                                 author: "Queens Park Hotel(1920s)",
                                 spec: queensParkSpec,
                                 buildOrder: queensParkBuild,
                                 tags: queensParkTags)

var queensParkSpec = [CocktailIngredient(.mint, value: 10, unit: .leaves),
                      CocktailIngredient(.lime, value: 0.75),
                      CocktailIngredient(.richDem, value: 0.5),
                      CocktailIngredient(.rumDemerara, value: 2),
                      CocktailIngredient(.angosturaBitters, value: 5, unit: .dashes) ]


var queensParkBuild = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the collins glass and gently press to release mint oils. Do not muddle"), 
                                           Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the angostura bitters, and swizzle. Try to keep the mint at the bottom of the glass."), 
                                           Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the Angostura bitters."),
                                           Instruction(step: 4, method: "Garnish with a mint bouquet.")])

var queensParkTags = Tags(flavors: [.lime, .mint, .bakingSpices], 
                          profiles: [.aromatic],
                          textures: [.light],
                          styles: [.swizzle, .built],
                          rum: [.rumDemerara])
