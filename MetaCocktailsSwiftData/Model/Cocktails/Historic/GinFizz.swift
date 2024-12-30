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



var ginFizzTags   = Tags(flavors: [.lemon],
                         profiles: [.citrusy, .effervescent, .light, .refreshing],
                         styles: [.fizz, .shaken])
                      
