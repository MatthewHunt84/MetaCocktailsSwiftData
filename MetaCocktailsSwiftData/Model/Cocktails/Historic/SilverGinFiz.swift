//
//  SilverGinFiz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var silverGinFizz  = Cocktail(cocktailName: "Silver Gin Fizz" + historicTag,
                              glasswareType: .fizzGlass,
                              ice: nil,
                              author: jerryThomas,
                              spec: silverGinFizzSpec,
                              buildOrder: silverGinFizzBuild,
                              tags: silverGinFizzTags,
                              variation: .silverFizz,
                              collection: .originals,
                              historicSpec: .silverFizz)

var silverGinFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 3, unit: .dashes),
                          OldCocktailIngredient(.otherNonAlc(.powderedSugar), value: 1, unit: .tablespoon),
                          OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                          OldCocktailIngredient(.gins(.oldTom), value: 1.5),
                          OldCocktailIngredient(.soda(.sparklingWater), value: 2)]



var silverGinFizzTags   = Tags(flavors: [.lemon],
                               profiles: [.citrusy, .effervescent, .light, .silky, .refreshing],
                               styles: [.fizz, .shaken])

