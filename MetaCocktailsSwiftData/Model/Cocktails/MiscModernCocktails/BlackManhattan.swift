//
//  BlackManhattan.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var blackManhattan = Cocktail(cocktailName: "Black Manhattan",
                              glasswareType: .coupe,
                              garnish: [.maraschinoCherry],
                              author:Author(person: "Todd Smith", place: AuthorPlaces.bourbonNBranch.rawValue, year: "2005"),
                              spec: blackManhattanSpec,
                              tags: blackManhattanTags)

var blackManhattanSpec     =  [CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                               CocktailIngredient(.bitters(.orangeBitters), value: 1, unit: .dashes),
                               CocktailIngredient(.amari(.averna), value: 1),
                               CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2)]

var blackManhattanTags     = Tags(profiles: [.spiritForward, .bittersweet, .punchy],
                                  styles: [.manhattan, .stirred])

