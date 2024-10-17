//
//  HarvestMoon.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var harvestMoon = Cocktail(cocktailName: "Harvest Moon",
                           glasswareType: .stemmedGlassware,
                           garnish: [.nutmeg],
                           ice: nil,
                           author: justWnG,
                           spec: harvestMoonSpec,
                           tags: harvestMoonTags,
                           collection: .williamsAndGraham)

let harvestMoonSpec = [OldCocktailIngredient(.juices(.lemon), value: 0.5),
                       OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                       OldCocktailIngredient(.bitters(.angosturaBitters), value: 1, unit: .dashes),
                       OldCocktailIngredient(.bitters(.appleBitters), value: 1, unit: .dashes),
                       OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 0.5),
                       OldCocktailIngredient(.liqueurs(.lopoldsApple), value: 0.75),
                       OldCocktailIngredient(.amari(.becherovka), value: 0.75),
                       OldCocktailIngredient(.vodkas(.woodyCreekVodka), value: 1.5)]


let harvestMoonTags = Tags(flavors: [.nutmeg],
                           profiles: [.fruity, .refreshing, .light],
                           styles: [.sour, .shaken])



