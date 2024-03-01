//
//  Algonquin(1935).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var algonquin  = Cocktail(cocktailName: "Algonquin",
                          glasswareType: .martini,
                          garnish: [.noGarnish],
                          author: Author(person: "G. Selmer Foughner", place: "Along The Wine Trail: an anthology of wine and spirits", year: "1935"),
                          spec: algonquinSpec,
                          tags: algonquinTags,
                          variation: .algonquin,
                          collection: .originals)

var algonquinSpec  = [CocktailIngredient(.juices(.pineappleJuice), value: 1),
                      CocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                      CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2)]



var algonquinTags   = Tags(profiles: [.fruity, .light, .dry],
                           styles: [.shaken, .sour])

