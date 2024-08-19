//
//  Saladito.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var saladito  = Cocktail(cocktailName: "Saladito",
                         glasswareType: .coupe,
                         garnish: [.pinchSalt, .pinchCayenne ],
                         author: Author(person: AuthorNames.marcosTello.rawValue,
                                        place: AuthorPlaces.milkAndHoney.rawValue,
                                        year: "Early 2000s"),
                         spec: saladitoSpec,
                         buildOrder: salditoBuild,
                         tags: saladitoTags,
                         variation: nil,
                         collection: .milkAndHoney)

var saladitoSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                     OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                     OldCocktailIngredient(.agaves(.mezcalEspadin) , value: 2)]


var saladitoTags   = Tags(profiles: [.citrusy, .refreshing, .complex],
                          styles: [.shaken, .sour])

var salditoBuild = Build(instructions: [Instruction(step: 1, method: "Combine the mezcal, honey syrup, and lime juice in a cocktail shaker, add one large ice cube, and shake vigorously until the drink is sufficiently chilled."),
                                        Instruction(step: 2, method: "Strain into a chilled coupe and garnish with a pinch each of cayenne pepper and sea salt.")])
