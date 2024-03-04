////
////  GinFizz.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI

var ginFizz  = Cocktail(cocktailName: "Gin Fizz",
                        glasswareType: .fizzGlass,
                        garnish: [.noGarnish],
                        ice: nil,
                        author: jerryThomas,
                        spec: ginFizzSpec,
                        buildOrder: ginFizzBuild,
                        tags: ginFizzTags,
                        variation: .ginFizz,
                        collection: .originals,
                        titleCocktail: true)

var ginFizzSpec  = [CocktailIngredient(.juices(.lemon), value: 1),
                    CocktailIngredient(.syrups(.simple), value: 1),
                    CocktailIngredient(.gins(.ginAny), value: 1.5),
                    CocktailIngredient(.soda(.sparklingWater), value: 2)]

var ginFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and shake with ice"), 
                                         Instruction(step: 2, method: "strain into a small chilled highball glass and top with sparkling water"),
                                         Instruction(step: 3, method: "Give a gentle stir"),
                                         Instruction(step: 4, method: "make it a silver fizz by adding egg whites and a dry shake before shaking with ice. This is the preferred method for most. In this case, add a lemon expression to the final product. (See 'Silver Gin Fizz')")])

var ginFizzTags   = Tags(flavors: [.lemon],
                         profiles: [.citrusy, .effervescent, .light, .refreshing],
                         styles: [.fizz, .shaken])
                      
