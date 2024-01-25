//
//  AmarettoSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/23/24.
//

import Foundation

var amarettoSour  = Cocktail(cocktailName: "Amaretto Sour",
                             glasswareType: .martini,
                             garnish: [.maraschinoCherry],
                             spec: amarettoSourSpec,
                             buildOrder: amarettoSourBuild,
                             tags: amarettoSourTags)

var amarettoSourSpec  = [CocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                         CocktailIngredient(.juices(.lemon), value: 1),
                         CocktailIngredient(.liqueurs(.amaretto) , value: 2)]



var amarettoSourTags   = Tags(profiles: [.citrusy, .refreshing, .light],
                              styles: [.shaken, .sour])

var amarettoSourBuild  = Build(instructions: [Instruction(step: 1, method: "NOTE: The original cocktail didn't have egg whites. We just think it makes a superior cocktail. In the case that you omit the egg whites, bring the citrus down to 0.75 oz. and add simple to taste."),
                                              Instruction(step: 2, method: "Add all ingredients, except for the bitters, into a tin and dry shake to emulsify."),
                                              Instruction(step: 3, method: "Then Shake with ice."),
                                              Instruction(step: 4, method: "Strain into a chilled glass.")])
