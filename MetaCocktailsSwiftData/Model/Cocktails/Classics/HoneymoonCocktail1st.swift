//
//  HoneymoonCocktail1st.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var honeymoonCocktail1st = Cocktail(cocktailName: "Honeymoon Cocktail",
                                    glasswareType: .stemmedGlassware,
                                    garnish: nil,
                                    ice: nil,
                                    author: hugoEnsslin,
                                    spec: honeymoonCocktailSpec1st,
                                    tags: honeymoonCocktailTags1st,
                                    variation: .honeymoon,
                                    collection: .originals,
                                    titleCocktail: true)

var honeymoonCocktailSpec1st =  [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                                 OldCocktailIngredient(.liqueurs(.orangeCuracao), value: 3, unit: .dashes),
                                 OldCocktailIngredient(.liqueurs(.benedictine), value: 1),
                                 OldCocktailIngredient(.brandies(.appleBrandy), value: 1)]


var honeymoonCocktailTags1st = Tags( profiles: [.fruity, .citrusy],
                                     styles: [.daisy, .shaken, .sour])
