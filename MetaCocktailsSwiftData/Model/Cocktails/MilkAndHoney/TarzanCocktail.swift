//
//  TarzanCocktail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var tarzanCocktail  = Cocktail(cocktailName: "Tarzan Cocktail",
                             glasswareType: .collins,
                             garnish: nil,
                             ice: .columnIce,
                             author: Author(person: AuthorNames.zacharyRubin.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "Early 2000s"),
                             spec: tarzanCocktailSpec,
                             buildOrder: tarzanCocktailBuild,
                             tags: tarzanCocktailTags,
                             variation: nil,
                             collection: .milkAndHoney)

var tarzanCocktailSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                         OldCocktailIngredient(.soda(.sodaWater), value: 1.5),
                         OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                         OldCocktailIngredient(.juices(.pineappleJuice), value: 1.5),
                         OldCocktailIngredient(.amari(.campari), value: 1),
                         OldCocktailIngredient(.gins(.ginAny) , value: 1)]



var tarzanCocktailTags   = Tags(flavors: [.lemon],
                              profiles: [.citrusy, .bittersweet, .effervescent, .light, .fruity],
                              styles: [.collins, .shaken, .fizz])

