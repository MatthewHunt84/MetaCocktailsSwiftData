//
//  Carajillo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

let carajillo = Cocktail(cocktailName: "Carajillo",
                        glasswareType: .singleOld,
                        ice: .crackedIce,
                        author: Author(place: "Someone, Somewhere, Sometime in Spain"),
                        spec: carajilloSpec,
                        tags: carajilloTags)

var carajilloSpec: [CocktailIngredient] = [CocktailIngredient(.otherNonAlc(.coldBrew), value: 1.5),
                                           CocktailIngredient(.liqueurs(.licor43), value: 1.5)]

var carajilloTags = Tags(profiles: [.citrusy, .refreshing],
                        textures: [.light],
                        styles: [.sour, .shaken])


