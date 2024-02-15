//
//  AirMail(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var airMailWnG  = Cocktail(cocktailName: "Air Mail(W&G Version)",
                           glasswareType: .flute,
                           garnish: [.noGarnish],
                           author: Author(place: AuthorPlaces.williamsAndGraham.rawValue,
                                          year: "2012"),
                           spec: airMailWnGSpec,
                           buildOrder: airMailWnGBuild,
                           tags: airMailWnGTags,
                           variation: .airMail)

var airMailWnGSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                       CocktailIngredient(.syrups(.honeySyrup), value: 0.75),
                       CocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                       CocktailIngredient(.wines(.prosecco) , value: 2)]

var airMailWnGBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                            Instruction(step: 2, method: "Add Champagne to the flute first!"),
                                            Instruction(step: 3, method: "Then add the shaken cocktail to that.")])

var airMailWnGTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                            styles: [.shaken, .fizz])

