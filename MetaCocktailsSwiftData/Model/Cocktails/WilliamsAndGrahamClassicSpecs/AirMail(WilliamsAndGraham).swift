//
//  AirMail(WilliamsAndGraham).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/22/24.
//

import Foundation

var airMailWnG  = Cocktail(cocktailName: "Air Mail" + wAndGTitleTag,
                           glasswareType: .flute,
                           garnish: [.noGarnish],
                           author: Author(place: AuthorPlaces.williamsAndGraham.rawValue,
                                          year: "2012"),
                           spec: airMailWnGSpec,
                           buildOrder: topWithChampagnMethod,
                           tags: airMailWnGTags,
                           variation: .airMail,
                           collection: .williamsAndGraham)

var airMailWnGSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                       OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                       OldCocktailIngredient(.rums(.plantationBarbados), value: 1.5),
                       OldCocktailIngredient(.wines(.prosecco) , value: 2)]


var airMailWnGTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                            styles: [.shaken, .fizz])

let wAndGTitleTag = " (W&G Version)"
