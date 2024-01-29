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
                         author: Author(person: AuthorNames.traderVic.rawValue, place: "'Bartender's Guide'", year: "New York: Garden City, 1947"),
                         spec: elDiabloSpec,
                         tags: elDiabloTags)

var elDiabloSpec  = [CocktailIngredient(.soda(.gingerBeer), value: 3),
                     CocktailIngredient(.juices(.lime), value: 0.5),
                     CocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.25),
                     CocktailIngredient(.agaves(.tequilaFortalezaRepo), value: 1.5)]



var elDiabloTags   = Tags(profiles: [.refreshing, .punchy, .effervescent, .sharp],
                          styles: [.fizz, .built])

