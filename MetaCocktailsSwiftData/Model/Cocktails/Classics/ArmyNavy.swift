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
                         buildOrder: armyNavyBuild,
                         tags: armyNavyTags)

var armyNavySpec  = [CocktailIngredient(.juices(.lemon), value: 0.75),
                     CocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBibleViewModel().orgeat),
                     CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                     CocktailIngredient(.gins(.fordsGin) , value: 2)]


var armyNavyTags   = Tags(profiles: [.citrusy, .tart, .light],
                          styles: [.shaken, .sour])
                          
var armyNavyBuild   = Build(instructions: [Instruction(step: 1, method: "This cocktail was not invented by Mr. Embury, we simply like his build the most and we think it's more suitable for the modern palate. The original author, like many classics, is unknown.")])
