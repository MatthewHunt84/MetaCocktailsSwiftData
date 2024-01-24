//
//  BloodAndSand(W&G).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bloodAndSandWnG  = Cocktail(cocktailName: "Blood & Sand (Williams & Graham spec.)",
                                glasswareType: .martini,
                                garnish: [.orangePeel],
                                ice: nil,
                                author:Author(person: AuthorNames.harryCraddock.rawValue, place: AuthorPlaces.savoy.rawValue, year: "1930"),
                                spec: bloodAndSandWnGSpec,
                                tags: bloodAndSandTags)

var bloodAndSandWnGSpec  = [CocktailIngredient(.juices(.lemon), value: 0.25),
                            CocktailIngredient(.juices(.orange), value: 0.75),
                            CocktailIngredient(.fortifiedWines(.carpanoAntica), value: 0.75),
                            CocktailIngredient(.liqueurs(.luxardoCherry), value: 0.75),
                            CocktailIngredient(.whiskies(.glenfiddich12), value: 0.75)]



var bloodAndSandWnGTags   = Tags(textures: [.rich],
                                 styles: [.sour, .shaken])

