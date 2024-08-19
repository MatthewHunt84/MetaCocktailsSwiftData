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
                     author:Author(person: AuthorNames.harryJohnson.rawValue, place: AuthorPlaces.harryJohnsonManual.rawValue, year: "1900"),
                     spec: bijouSpec,
                     tags: bijouTags,
                     variation: .bijou,
                     collection: .originals,
                     titleCocktail: true)

var bijouSpec     =  [OldCocktailIngredient(.bitters(.orangeBitters), value: 2, unit: .dashes),
                      OldCocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 1),
                      OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 1),
                      OldCocktailIngredient(.gins(.plymouth), value: 1)]

var bijouTags     = Tags(flavors: [.lemon],
                         profiles: [.spiritForward, .complex,  .rich],
                         styles: [.martini, .stirred])

