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
                         ice: .crackedIce,
                         author: Author(person: AuthorNames.traderVic.rawValue, place: "Bartender's Guide", year: "New York: Garden City, 1947"),
                         spec: elDiabloSpec,
                         notes: elDiabloNotes,
                         tags: elDiabloTags,
                         collection: .originals)

var elDiabloSpec  = [OldCocktailIngredient(.soda(.gingerAle), value: 3),
                     OldCocktailIngredient(.juices(.lime), value: 0.5),
                     OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.5),
                     OldCocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 1)]



var elDiabloTags   = Tags(profiles: [.refreshing, .punchy, .effervescent],
                          styles: [.fizz, .built])


var elDiabloNotes = "The original 'Diablo' cocktail first appeared in the 1940 book 'The How and When' by Hayman Gale and Gerald F. Marco. Initially, it was a rum-based drink. Trader Vic later modified the recipe, substituting tequila for rum, and dubbed it 'Mexican El Diablo'. Eventually, he shortened the name to simply 'El Diablo'."
