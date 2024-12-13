//
//  HouseSilverFizz.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation
var houseSilverGinFizz  = Cocktail(cocktailName: "Silver Gin Fizz" + houseTag,
                                   glasswareType: .fizzGlass,
                                   garnish: [.lemonPeel],
                                   spec: houseSilverGinFizzSpec,
                                   buildOrder: houseSilverGinFizzBuild,
                                   tags: houseSilverGinFizzTags,
                                   variation: .silverFizz,
                                   collection: .house)

var houseSilverGinFizzSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                               OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                               OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                               OldCocktailIngredient(.gins(.ginAny), value: 1.5),
                               OldCocktailIngredient(.soda(.sparklingWater), value: 2)]



var houseSilverGinFizzTags   = Tags(flavors: [.lemon],
                                    profiles: [.citrusy, .effervescent, .light, .silky, .refreshing],
                                    styles: [.fizz, .shaken])
