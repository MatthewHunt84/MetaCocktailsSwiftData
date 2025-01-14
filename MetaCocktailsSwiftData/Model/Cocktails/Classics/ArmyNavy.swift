//
//  ArmyNavy.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var armyNavy  = Cocktail(cocktailName: "Army & Navy",
                         glasswareType: .coupe,
                         garnish: [.lemonPeel],
                         author: davidEmbury,
                         spec: armyNavySpec,
                         notes: armyNavyNote,
                         tags: armyNavyTags,
                         collection: .originals)

var armyNavySpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                     OldCocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBible.orgeat),
                     OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                     OldCocktailIngredient(.gins(.fordsGin) , value: 2)]


var armyNavyTags   = Tags(profiles: [.citrusy, .tart, .light],
                          styles: [.shaken, .sour])
