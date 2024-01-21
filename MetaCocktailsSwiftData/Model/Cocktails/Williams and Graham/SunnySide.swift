//
//  SunnySide.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/15/24.
//

import Foundation


var sunnySide = Cocktail(cocktailName: "Sunny Side",
                         imageAsset: nil,
                         glasswareType: .doubleOld,
                         garnish: [.mintBouquet],
                         ice: .bigRock,
                         author: [Authors.jamesMenkal.rawValue, Authors.williamsAndGraham.rawValue],
                         spec: sunnySideSpec,
                         buildOrder: sunnySideBuild,
                         tags: sunnySideTags)

let sunnySideSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                           CocktailIngredient(.juices(.lime), value: 0.75),
                                           CocktailIngredient(.syrups(.cucumberSyrup), value: 0.5),
                                           CocktailIngredient(.syrups(.gingerSyrup), value: 0.25),
                                           CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                           CocktailIngredient(.gins(.ginAny), value: 1.5)]
                                        

let sunnySideTags = Tags(profiles: [.herbal, .refreshing],
                      textures: [.light],
                      styles: [.sour, .shaken])

let sunnySideBuild =  Build(instructions: [Instruction(step: 1, method: "Use Kold draft or Hoshizake cubes and the mint will the muddled while you're shaking."),
                                           Instruction(step: 2, method: "Double strain the shaken cocktail over a big rock."),
                                           Instruction(step: 3, method: "Garnish with a mint bouquet.")])

