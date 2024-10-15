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
                         notes: armyNavyBuild,
                         tags: armyNavyTags,
                         collection: .originals)

var armyNavySpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                     OldCocktailIngredient(.syrups(.orgeat), value: 0.75, prep: PrepBible.orgeat),
                     OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                     OldCocktailIngredient(.gins(.fordsGin) , value: 2)]


var armyNavyTags   = Tags(profiles: [.citrusy, .tart, .light],
                          styles: [.shaken, .sour])
                          
var armyNavyBuild   = "This cocktail was not invented by Mr. Embury, we simply like his build the most and we think it's more suitable for the modern palate. The original author, like many classics, is unknown."
