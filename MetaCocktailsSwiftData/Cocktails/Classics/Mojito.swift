//
//  Mojito.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/20/23.
//

import SwiftUI

var mojito = Cocktail(cocktailName: "Mojito",
                                   imageAsset: nil,
                                   glasswareType: .collins,
                                   garnish: [.mintBouquet],
                                   ice: .koldDraft,
                                   spec: mojitoSpec,
                                   buildOrder: mojitoBuild,
                                   tags: mojitoTags)

let mojitoTags = Tags(profiles: [.herbal, .refreshing],
                      textures: [.light, .effervescent],
                      styles: [.sour, .shaken, .built],
                      bases: [.rumWhite, .rumAged, .rumDemerara, .rumJamaicanAged])

let mojitoSpec: [CocktailIngredient] = [CocktailIngredient(.mint, value: 8, unit: .leaves),
                                        CocktailIngredient(.lime, value: 0.75),
                                        CocktailIngredient(.simple, value: 0.75),
                                        CocktailIngredient(.rumWhite, value: 1.5),
                                        CocktailIngredient(.sparklingWater, value: 2)]

let mojitoBuild =  Build(instructions: [Instruction(step: 1, method: "Shake all of the ingredients accept for the soda in a tin. Use Kold draft of Hoshizake cubes and the mint will the muddled while you're shaking."),
                                                     Instruction(step: 2, method: "Add the ice then soda to the glass. Try not to pour the soda directly over the ice"),
                                                     Instruction(step: 3, method: "Double strain the shaken cocktail over the soda and ice."),
                                                     Instruction(step: 4, method: "Garnish with a mint bouquet. Serve with a straw.")])

