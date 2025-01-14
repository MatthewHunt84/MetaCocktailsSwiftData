//
//  HarveyWallbanger.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/27/24.
//

import Foundation

var harveyWallbanger = Cocktail(cocktailName: "Harvey Wallbanger",
                                glasswareType: .collins,
                                garnish: [.maraschinoCherry],
                                ice: .pebbleIce,
                                author:Author(person: "George Bednar",
                                              place: "California",
                                              year: "1969"),
                                spec: harveyWallbangerSpec,
                                buildOrder: harveyWallbangerBuild,
                                notes: harveyWalbangerNote,
                                tags: harveyWallbangerTags,
                                variation: .harveyWallbanger,
                                collection: .originals,
                                titleCocktail: true)

var harveyWallbangerSpec     =  [OldCocktailIngredient(.liqueurs(.galliano), value: 0.75),
                                OldCocktailIngredient(.juices(.orange), value: 2),
                                OldCocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var harveyWallbangerTags     = Tags(profiles: [.fruity, .sweet],
                                   styles: [.sour, .built])


