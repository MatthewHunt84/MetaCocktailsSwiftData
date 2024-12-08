//
//  EspressoMartiniOG.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 12/1/24.
//

import Foundation

var espressoMartiniOG = Cocktail(cocktailName: "Espresso Martini",
                                 glasswareType: .martini,
                                 garnish: [.coffeeBeans],
                                 author: Author(person: AuthorNames.dickBradsell.rawValue, place: AuthorPlaces.sohoBrasserie.rawValue, year: "1983"),
                                 spec: espressoMartiniSpecOG,
                                 tags: espressoMartiniTagsOG,
                                 variation: .espressoMartini,
                                 collection: .originals)

var espressoMartiniSpecOG  = [OldCocktailIngredient(.syrups(.richDem), value: 5, unit: .ml, prep: PrepBible.richDem),
                              OldCocktailIngredient(.liqueurs(.tiaMaria), value: 10, unit: .ml),
                              OldCocktailIngredient(.liqueurs(.kahlua), value: 15, unit: .ml),
                              OldCocktailIngredient(.otherNonAlc(.espressoShot), value: 25, unit: .ml),
                              OldCocktailIngredient(.vodkas(.vodkaAny), value: 50, unit: .ml)]

var espressoMartiniTagsOG = Tags(profiles: [.punchy, .bittersweet],
                                 styles: [.shaken])



