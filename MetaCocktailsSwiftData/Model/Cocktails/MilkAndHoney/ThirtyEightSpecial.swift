//
//  ThirtyEightSpecial.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/29/24.
//

import Foundation


var thirtyEightSpecial = Cocktail(cocktailName: ".38 Special",
                                  glasswareType: .coupe,
                                  garnish: [.lemonPeel],
                                  ice: nil,
                                  author:Author(person: AuthorNames.michaelMadrusan.rawValue ,  place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                                  spec: thirtyEightSpecialSpec,
                                  tags: thirtyEightSpecialTags,
                                  collection: .milkAndHoney)

var thirtyEightSpecialSpec     =  [CocktailIngredient(.amari(.cioCiaroAmaro), value: 0.375),
                                   CocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.375),
                                   CocktailIngredient(.whiskies(.scotchBlended), value: 2.375)]

var thirtyEightSpecialTags     = Tags(profiles: [.spiritForward, .bittersweet, .herbal, .complex],
                                      styles: [.manhattan, .stirred])
