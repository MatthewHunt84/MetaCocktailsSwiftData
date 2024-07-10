//
//  PeaksOfReykjavik.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var peaksOfReykjavic = Cocktail(cocktailName: "Peaks of Reykjavic",
                                imageAsset: nil,
                                glasswareType: .collins,
                                garnish: [.raspberry, .mintSprig],
                                ice: .pebbleIce,
                                author: Author(person: "Tom Lagae", place: AuthorPlaces.williamsAndGraham.rawValue, year: "2018"),
                                spec: peaksOfReykjavicSpec,
                                buildOrder: peaksOfReykjavicBuild,
                                tags: peaksOfReykjavicTags,
                                collection: .williamsAndGraham)

let peaksOfReykjavicSpec = [OldCocktailIngredient(.bitters(.peychauds), value: 4, unit: .dashes),
                            OldCocktailIngredient(.juices(.lime), value: 0.75),
                            OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                            OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5),
                            OldCocktailIngredient(.liqueurs(.licor43), value: 0.25),
                            OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                            OldCocktailIngredient(.vodkas(.reyka), value: 0.75)]


let peaksOfReykjavicTags = Tags(profiles: [.fruity, .refreshing, .light],
                                styles: [.sour, .swizzle])



var peaksOfReykjavicBuild = Build(instructions: [Instruction(step: 1, method: "Add mint to the bottom of the collins glass and gently press to release mint oils. Do not muddle"),
                                                 Instruction(step: 2, method: "Pack the glass with pebble ice and add the rest of the ingredients, besides the bitters, and swizzle. Try to keep the mint at the bottom of the glass."),
                                                 Instruction(step: 3, method: "Pack the glass with more ice to fill and then add the bitters."),
                                                 Instruction(step: 4, method: "Garnish with a raspberry and mint sprig.")])
