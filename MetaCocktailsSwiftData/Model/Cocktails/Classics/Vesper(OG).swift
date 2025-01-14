//
//  Vesper(OG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var vesper = Cocktail(cocktailName: "Vesper",
                      glasswareType: .martini,
                      garnish: [.lemonPeel],
                      author: Author(person: "Ivar Bryce", place: "Casino Royale: by Ian Fleming", year: "1953"),
                      spec: vesperSpec,
                      notes: vesperNote,
                      tags: vesperTags,
                      variation: .vesper,
                      collection: .originals,
                      titleCocktail: true)

var vesperSpec     =  [OldCocktailIngredient(.fortifiedWines(.kinaLillet), value: 0.25),
                       OldCocktailIngredient(.vodkas(.vodkaAny), value: 0.5),
                       OldCocktailIngredient(.gins(.ginAny), value: 1.5)]

var vesperTags    = Tags(flavors: [.lemon],
                         profiles: [.spiritForward, .dry, .botanical],
                         styles: [.martini, .shaken])
