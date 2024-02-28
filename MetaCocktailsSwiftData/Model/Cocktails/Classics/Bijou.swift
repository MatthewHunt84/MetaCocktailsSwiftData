//
//  Bijou.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var bijou = Cocktail(cocktailName: "Bijou(1900)",
                     glasswareType: .stemmedGlassware,
                     garnish: [.lemonPeel],
                     author:Author(person: AuthorNames.harryJohnson.rawValue, place: AuthorPlaces.harryJohnsonManual.rawValue, year: "1900"),
                     spec: bijouSpec,
                     tags: bijouTags,
                     variation: .bijou)

var bijouSpec     =  [CocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                      CocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                      CocktailIngredient(.gins(.plymouth), value: 1)]

var bijouTags     = Tags(profiles: [.spiritForward, .complex,  .rich],
                         styles: [.martini, .stirred])

