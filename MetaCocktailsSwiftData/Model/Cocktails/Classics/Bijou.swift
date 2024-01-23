//
//  Bijou.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bijou = Cocktail(cocktailName: "Bijou",
                     glasswareType: .stemmedGlassware,
                     garnish: [.lemonPeel],
                     author:Author(year: "1895"),
                     spec: bijouSpec,
                     tags: bijouTags)

var bijouSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                      CocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                      CocktailIngredient(.gins(.plymouth), value: 1)]

var bijouTags     = Tags(profiles: [.spiritForward],
                         textures: [.rich],
                         styles: [.martini, .stirred])

