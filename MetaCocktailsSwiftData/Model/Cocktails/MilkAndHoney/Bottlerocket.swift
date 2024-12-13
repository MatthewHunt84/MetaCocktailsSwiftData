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



var bottlerocketTags   = Tags(profiles: [.citrusy, .effervescent, .light, .spicy],
                              styles: [.collins, .shaken])

