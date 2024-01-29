//
//  SilverGinFiz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/26/24.
//

import Foundation

var silverGinFizz  = Cocktail(cocktailName: "Silver Gin Fizz",
                              glasswareType: .fizzGlass,
                              garnish: [.lemonPeel],
                              ice: nil,
                              author:Author(person: AuthorNames.jerryThomas.rawValue, place: AuthorPlaces.howToMixDrinksJT.rawValue, year: "1862"),
                              spec: silverGinFizzSpec,
                              buildOrder: silverGinFizzBuild,
                              tags: silverGinFizzTags)

var silverGinFizzSpec  = [CocktailIngredient(.juices(.lemon), value: 1),
                          CocktailIngredient(.syrups(.simple), value: 1),
                          CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                          CocktailIngredient(.gins(.ginAny), value: 1.5),
                          CocktailIngredient(.soda(.sparklingWater), value: 2)]

var silverGinFizzBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the sparkling water, into a tin and dry shake"),
                                               Instruction(step: 2, method: "Then shake with ice."),
                                               Instruction(step: 3, method: "Add soda to the glass then strain the cocktail over the soda"),
                                               Instruction(step: 4, method: "Express the lemon peen then garnish with the peel.")])

var silverGinFizzTags   = Tags(flavors: [.lemon],
                               profiles: [.citrusy, .effervescent, .light, .silky, .refreshing],
                               styles: [.fizz, .shaken])

