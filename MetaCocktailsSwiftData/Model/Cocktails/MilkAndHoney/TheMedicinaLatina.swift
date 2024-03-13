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
                                 variation: .penicillin,
                                 collection: .milkAndHoney,
                                 titleCocktail: false)

var theMedicinaLatinaSpec = [CocktailIngredient(.juices(.lime), value: 0.75, unit: .fluidOunces),
                             CocktailIngredient(.syrups(.honeySyrup), value: 0.375, prep: PrepBible.honeySyrup),
                             CocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBible.gingerSyrup),
                             CocktailIngredient(.agaves(.tequilaBlanco), value: 2),
                             CocktailIngredient(.agaves(.mezcalSmokeyAny), value: 0.15, unit: .fluidOuncesFloated)]

var theMedicinaLatinaTags = Tags(flavors: [.lemon, .honey, .ginger],
                                 profiles: [.citrusy, .smokey, .light, .complex],
                                 styles: [.sour, .shaken])

var theMedicinaLatinaBuild = Build(instructions: [Instruction(step: 1, method: "Mix all ingredients, except the smokey mezcal, together in a tin and shake with ice."),
                                                  Instruction(step: 2, method: "Strain over ice."),
                                                  Instruction(step: 3, method: "Float the smokey mezcal on top of the cocktail"),
                                                  Instruction(step: 4, method: "Garnish With a piece of candied ginger.")])
