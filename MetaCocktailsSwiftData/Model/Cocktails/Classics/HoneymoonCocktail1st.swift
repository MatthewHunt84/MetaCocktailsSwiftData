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
                                    variation: .honeymoon)

var honeymoonCocktailSpec1st =  [CocktailIngredient(.juices(.lemon), value: 0.5),
                                 CocktailIngredient(.liqueurs(.orangeCuracao), value: 3, unit: .dashes),
                                 CocktailIngredient(.liqueurs(.benedictine), value: 1),
                                 CocktailIngredient(.brandies(.appleBrandy), value: 1)]


var honeymoonCocktailTags1st = Tags( profiles: [.fruity, .citrusy],
                                     styles: [.daisy, .shaken, .sour])
