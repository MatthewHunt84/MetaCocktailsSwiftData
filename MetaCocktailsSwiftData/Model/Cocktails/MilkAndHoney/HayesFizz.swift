//
//  HayesFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var hayesFizz  = Cocktail(cocktailName: "Hayes Fizz",
                          glasswareType: .collins,
                          garnish: [.maraschinoCherry, .halfOrangeWheel],
                          ice: .columnIce,
                          author: sashaPetraske,
                          spec: hayesFizzSpec,
                          buildOrder: hayesFizzBuild,
                          tags: hayesFizzTags,
                          variation: nil,
                          collection: .milkAndHoney)

var hayesFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                      OldCocktailIngredient(.otherAlcohol(.absinthe), value: 5, unit: .sprays),
                      OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.gins(.ginAny), value: 2),
                      OldCocktailIngredient(.soda(.sodaWater) , value: 2)]



var hayesFizzTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                           styles: [.collins, .shaken])

