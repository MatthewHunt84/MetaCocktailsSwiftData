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



var bicycleThiefTags   = Tags(flavors: [.lemon],
                              profiles: [.citrusy, .bittersweet, .effervescent, .light, .fruity],
                              styles: [.collins, .shaken, .fizz])

