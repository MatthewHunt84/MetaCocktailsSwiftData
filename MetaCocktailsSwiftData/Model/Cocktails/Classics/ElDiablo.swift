//
//  ElDiablo.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/24/24.
//

import Foundation

var elDiablo  = Cocktail(cocktailName: "El Diablo",
                         glasswareType: .collins,
                         garnish: [.limeWheel],
                         ice: .pebbleIce,
                         author: Author(person: AuthorNames.traderVic.rawValue, place: "Bartender's Guide", year: "New York: Garden City, 1947"),
                         spec: elDiabloSpec,
                         buildOrder: elDiabloBuildOrder,
                         notes: elDiabloNotes,
                         tags: elDiabloTags,
                         variation: .elDiablo,
                         collection: .originals)

var elDiabloSpec  = [OldCocktailIngredient(.soda(.gingerAle), value: 3),
                     OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5),
                     OldCocktailIngredient(.agaves(.tequilaAny), value: 1)]



var elDiabloTags   = Tags(profiles: [.refreshing, .punchy, .effervescent],
                          styles: [.fizz, .built])

var elDiabloBuildOrder = Build(instructions: [Instruction(step: 1, method: "Shake everything but the ginger ale with ice."),
                                              Instruction(step: 1, method: "Strain into a collins glass full of ice and top the ginger ale.")])
