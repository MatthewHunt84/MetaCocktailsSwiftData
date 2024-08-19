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

var tarzanCocktailBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                              Instruction(step: 2, method: "Strain into a collins glass over ice and top with soda"),
                                              Instruction(step: 3, method: "Give a gentle stir")])

var tarzanCocktailTags   = Tags(flavors: [.lemon],
                              profiles: [.citrusy, .bittersweet, .effervescent, .light, .fruity],
                              styles: [.collins, .shaken, .fizz])

