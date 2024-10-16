////
////  GinFizz.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI

var ginFizz  = Cocktail(cocktailName: "Gin Fizz" + historicTag,
                        glasswareType: .fizzGlass,
                        garnish: [.noGarnish],
                        ice: nil,
                        author: jerryThomas,
                        spec: ginFizzSpec,
                        buildOrder: ginFizzBuild,
                        tags: ginFizzTags,
                        variation: .ginFizz,
                        collection: .originals,
                        titleCocktail: true,
                        historicSpec: .ginFizz)

var ginFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 3, unit: .dashes),
                    OldCocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .tablespoon),
                    OldCocktailIngredient(.gins(.geneverAny), value: 1.5),
                    OldCocktailIngredient(.soda(.sparklingWater), value: 2)]

var ginFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and shake with ice"), 
                                         Instruction(step: 2, method: "strain into a small chilled highball glass and top with sparkling water"),
                                         Instruction(step: 3, method: "Give a gentle stir"),
                                         Instruction(step: 4, method: "make it a silver fizz by adding egg whites and a dry shake before shaking with ice. This is the preferred method for most. In this case, add a lemon expression to the final product. (See 'Silver Gin Fizz')")])

var ginFizzTags   = Tags(flavors: [.lemon],
                         profiles: [.citrusy, .effervescent, .light, .refreshing],
                         styles: [.fizz, .shaken])
                      
