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
                                tags: harveyWallbangerTags,
                                variation: .harveyWallbanger,
                                collection: .originals)

var harveyWallbangerSpec     =  [CocktailIngredient(.liqueurs(.galliano), value: 0.75, unit: .float),
                                CocktailIngredient(.juices(.orange), value: 2),
                                CocktailIngredient(.vodkas(.vodkaAny), value: 1.5)]

var harveyWallbangerTags     = Tags(profiles: [.fruity, .sweet, .gross],
                                   styles: [.sour, .built])

var harveyWallbangerBuild = Build(instructions: [Instruction(step: 1, method: "This is a built cocktail that gained popularity through a marketing campaign from George Bednar for McKesson Imports(Galliano's importer at the time). Though, the drink itself was likely the of bartender Donato 'Duke' Antone, who may have been serving it since the 1950s at the Hollywood bar Black Watch, calling it the 'Duke Screwdriver'. Bednar picked it up in the the late 60s and built an advertising campaign around it for McKesson. It goes to show you that even if the cocktail is total trash, as long as its easy to make and there's tons of advertising behind it, it has a chance to make it into the history books and people like me, who dedicate their entire career to perfecting their craft, end up writing about it.")])
