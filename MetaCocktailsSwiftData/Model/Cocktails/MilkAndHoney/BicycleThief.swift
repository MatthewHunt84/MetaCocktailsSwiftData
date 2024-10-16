//
//  BicycleThief.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var bicycleThief  = Cocktail(cocktailName: "Bicycle Thief",
                             glasswareType: .collins,
                             garnish: nil,
                             ice: .columnIce,
                             author: Author(person: AuthorNames.zacharyRubin.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: bicycleThiefSpec,
                             buildOrder: bicycleThiefBuild,
                             tags: bicycleThiefTags,
                             variation: nil,
                             collection: .milkAndHoney)

var bicycleThiefSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                         OldCocktailIngredient(.soda(.sodaWater), value: 1.5),
                         OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.juices(.grapefruit), value: 1.5),
                         OldCocktailIngredient(.amari(.campari), value: 1),
                         OldCocktailIngredient(.gins(.ginAny) , value: 1)]

var bicycleThiefBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                              Instruction(step: 2, method: "Strain into a collins glass over ice and top with soda"),
                                              Instruction(step: 3, method: "Give a gentle stir")])

var bicycleThiefTags   = Tags(flavors: [.lemon],
                              profiles: [.citrusy, .bittersweet, .effervescent, .light, .fruity],
                              styles: [.collins, .shaken, .fizz])

