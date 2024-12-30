//
//  TheMedicinaLatina.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var theMedicinaLatina = Cocktail(cocktailName: "The Medicina Latina",
                                 glasswareType: Glassware.doubleOld,
                                 garnish: [.candiedGinger],
                                 ice: .bigRock,
                                 author:Author(person: AuthorNames.sashaPetraske.rawValue,
                                               place: AuthorPlaces.milkAndHoney.rawValue),
                                 spec: theMedicinaLatinaSpec,
                                 buildOrder: theMedicinaLatinaBuild,
                                 tags: theMedicinaLatinaTags,
                                 variation: nil,
                                 collection: .milkAndHoney,
                                 titleCocktail: false)

var theMedicinaLatinaSpec = [OldCocktailIngredient(.juices(.lime), value: 0.75, unit: .fluidOunces),
                             OldCocktailIngredient(.syrups(.honeySyrup), value: 0.375, prep: PrepBible.honeySyrup),
                             OldCocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                             OldCocktailIngredient(.agaves(.tequilaBlanco), value: 2),
                             OldCocktailIngredient(.agaves(.mezcalSmokeyAny), value: 1, unit: .barSpoon)]

var theMedicinaLatinaTags = Tags(flavors: [.lime, .honey, .ginger],
                                 profiles: [.citrusy, .smokey, .light, .complex],
                                 styles: [.sour, .shaken])


