//
//  PeaksOfReykjavik.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var peaksOfReykjavic = Cocktail(cocktailName: "Peaks of Reykjavic",
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
                            OldCocktailIngredient(.syrups(.demSyrupOneToOne), value: 0.5, prep: PrepBible.demSyrupPrep),
                            OldCocktailIngredient(.liqueurs(.licor43), value: 0.25),
                            OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.5),
                            OldCocktailIngredient(.vodkas(.reyka), value: 0.75)]


let peaksOfReykjavicTags = Tags(profiles: [.herbal, .refreshing, .light],
                                styles: [.sour, .swizzle])




