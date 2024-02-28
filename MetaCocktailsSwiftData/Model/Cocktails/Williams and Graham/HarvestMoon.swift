//
//  HarvestMoon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var harvestMoon = Cocktail(cocktailName: "Harvest Moon",
                           imageAsset: nil,
                           glasswareType: .stemmedGlassware,
                           garnish: [.nutmeg],
                           ice: nil,
                           author: justWnG,
                           spec: harvestMoonSpec,
                           tags: harvestMoonTags)

let harvestMoonSpec = [CocktailIngredient(.juices(.lemon), value: 0.5),
                       CocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBibleViewModel().honeySyrup),
                       CocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dash),
                       CocktailIngredient(.bitters(.appleBitters), value: 1, unit: .dash),
                       CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5),
                       CocktailIngredient(.liqueurs(.lopoldsApple), value: 0.75),
                       CocktailIngredient(.amari(.becherovka), value: 0.75),
                       CocktailIngredient(.vodkas(.woodyCreekVodka), value: 1.5)]


let harvestMoonTags = Tags(profiles: [.fruity, .refreshing, .light],
                           styles: [.sour, .shaken])



