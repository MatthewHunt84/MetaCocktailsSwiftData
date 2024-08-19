//
//  OldPal.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/29/24.
//

import Foundation

var oldPal  =  Cocktail(cocktailName: "Old Pal",
                        glasswareType: .coupe,
                        garnish: [.lemonPeel],
                        ice: nil ,
                        author:Author(person: "Harry MacElhone",place: "New York Bar, Paris", year: "1920's"),
                        spec: oldPalSpec,
                        buildOrder: nil,
                        tags: oldPalTags,
                        variation: .oldPal,
                        collection: .originals,
                        titleCocktail: true)

var oldPalSpec = [OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1),
                  OldCocktailIngredient(.fortifiedWines(.dryVermouthAny), value: 1),
                  OldCocktailIngredient(.amari(.campari), value: 1)]

var oldPalTags = Tags(flavors: [.orange, .lemon],
                      profiles: [.bittersweet, .spiritForward, .rich],
                      styles: [.negroni, .stirred])

