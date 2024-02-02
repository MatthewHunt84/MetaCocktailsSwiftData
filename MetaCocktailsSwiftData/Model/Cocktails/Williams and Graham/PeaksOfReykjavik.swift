//
//  PeaksOfReykjavik.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var peaksOfReykjavic = Cocktail(cocktailName: "Peaks of Reykjavic",
                                imageAsset: nil,
                                glasswareType: .martini,
                                garnish: [.raspberry],
                                ice: nil,
                                author: williamsAndGraham,
                                spec: peaksOfReykjavicSpec,
                                buildOrder: peaksOfReykjavicBuild,
                                tags: peaksOfReykjavicTags)

let peaksOfReykjavicSpec = [CocktailIngredient(.bitters(.peychauds), value: 4, unit: .dashes),
                            CocktailIngredient(.juices(.lime), value: 0.75),
                            CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                            CocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                            CocktailIngredient(.liqueurs(.licor43), value: 0.25),
                            CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                            CocktailIngredient(.vodkas(.reyka), value: 0.75)]


let peaksOfReykjavicTags = Tags(profiles: [.fruity, .refreshing, .light],
                                styles: [.sour, .swizzle])



var peaksOfReykjavicBuild = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the collins glass and gently press to release mint oils. Do not muddle"),
                                                 Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the bitters, and swizzle. Try to keep the mint at the bottom of the glass."),
                                                 Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the bitters."),
                                                 Instruction(step: 4, method: "Garnish with a mint sprig.")])
