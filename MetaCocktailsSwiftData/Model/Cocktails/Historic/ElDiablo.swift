//
//  ElDiablo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elDiablo  = Cocktail(cocktailName: "El Diablo" + historicTag,
                         glasswareType: .collins,
                         garnish: [.limeWheel],
                         ice: .pebbleIce,
                         author: Author(person: AuthorNames.traderVic.rawValue, place: "Bartender's Guide", year: "New York: Garden City, 1947"),
                         spec: elDiabloSpec,
                         buildOrder: elDiabloBuild,
                         notes: elDiabloNote,
                         tags: elDiabloTags,
                         variation: .elDiablo,
                         collection: .originals,
                         historicSpec: .elDiablo)

var elDiabloSpec  = [OldCocktailIngredient(.soda(.gingerAle), value: 3),
                     OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5),
                     OldCocktailIngredient(.agaves(.tequilaAny), value: 1)]



var elDiabloTags   = Tags(profiles: [.refreshing, .punchy, .effervescent],
                          styles: [.fizz, .built])


