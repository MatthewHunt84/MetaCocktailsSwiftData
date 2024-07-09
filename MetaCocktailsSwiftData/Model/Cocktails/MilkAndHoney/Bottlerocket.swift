//
//  Bottlerocket.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var bottlerocket  = Cocktail(cocktailName: "Bottlerocket",
                             glasswareType: .collins,
                             garnish: nil,
                             ice: .koldDraft,
                             author: Author(person: AuthorNames.theoLieberman.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: bottlerocketSpec,
                             buildOrder: nil,
                             tags: bottlerocketTags,
                             variation: nil,
                             collection: .milkAndHoney)

var bottlerocketSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                         OldCocktailIngredient(.soda(.sodaWater), value: 1.5),
                         OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                         OldCocktailIngredient(.otherNonAlc(.jalapenoSlice), value: 1, unit: .gentlyMuddled),
                         OldCocktailIngredient(.agaves(.tequilaBlanco) , value: 2)]

var bottlerocketBuild  = Build(instructions: [Instruction(step: 1, method: "Combine the tequila, lime juice, honey syrup, and jalapeño in a cocktail shaker, fill the shaker with ice, and shake vigorously until the drink is sufficiently chilled."),
                                              Instruction(step: 2, method: "Strain into a Collins glass filled with ice and top off with the club soda.")])

var bottlerocketTags   = Tags(profiles: [.citrusy, .effervescent, .light, .spicy],
                              styles: [.collins, .shaken])

