//
//  AlaskaCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var alaska  = Cocktail(cocktailName: "Alaska Cocktail" + historicTag,
                       glasswareType: .martini,
                       garnish: [.noGarnish],
                       author: Author(place: "'Fashions in Mixed Drinks.' Guthrie Daily Leader", year: "October 18, 1905"),
                       spec: alaskaSpec,
                       tags: alaskaTags,
                       variation: .alaska,
                       collection: .originals,
                       titleCocktail: true,
                       historicSpec: .alaska)

var alaskaSpec  = [OldCocktailIngredient(.liqueurs(.yellowChartreuse), value: 0.75),
                   OldCocktailIngredient(.gins(.ginLondonDry), value: 2.25)]



var alaskaTags   = Tags(profiles: [.spiritForward, .rich],
                        styles: [.stirred, .martini])

var historicTag = " (Historical Recipe)"

