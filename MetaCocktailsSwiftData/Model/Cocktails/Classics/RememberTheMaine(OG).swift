//
//  RememberTheMaine(OG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var rememberTheMaineOG = Cocktail(cocktailName: "Remember The Maine(OG)",
                                  glasswareType: .coupe,
                                  garnish: [.maraschinoCherry],
                                  author: charlesBaker,
                                  spec: rememberTheMaineOGSpec,
                                  tags: rememberTheMaineOGTags)

var rememberTheMaineOGSpec     =  [CocktailIngredient(.otherAlcohol(.absinthe), value: 0.5, unit: .teaspoon),
                                   CocktailIngredient(.liqueurs(.cherryHeering), value: 2, unit: .teaspoons),
                                   CocktailIngredient(.fortifiedWines(.sweetVermouthAny), value: 0.75),
                                   CocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 2)]

var rememberTheMaineOGTags     = Tags(profiles: [.spiritForward, .bittersweet, .complex, .elegant],
                                      styles: [.manhattan, .stirred])

