//
//  GinRicky.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var ginRickey  = Cocktail(cocktailName: "Gin Rickey",
                          glasswareType: .fizzGlass,
                          garnish: [.limeHalf],
                          ice: .koldDraft,
                          author:Author(person: "Joe Rickey", year: "1883"),
                          spec: ginRickeySpec,
                          tags: ginRickeyTags)

var ginRickeySpec  = [OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                      OldCocktailIngredient(.soda(.sparklingWater), value: 4)]

var ginRickeyTags   = Tags(profiles: [.citrusy, .effervescent, .light, .refreshing, .dry],
                           styles: [.fizz, .built])

