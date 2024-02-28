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
                         author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                       place: AuthorPlaces.williamsAndGraham.rawValue),
                         spec: sunnySideSpec,
                         buildOrder: sunnySideBuild,
                         tags: sunnySideTags)

let sunnySideSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 8, unit: .gentlyMuddled),
                                           CocktailIngredient(.juices(.lime), value: 0.75),
                                           CocktailIngredient(.syrups(.cucumberSyrup), value: 0.5, prep: PrepBibleViewModel().cucumberSyrup),
                                           CocktailIngredient(.syrups(.gingerSyrup), value: 0.25, prep: PrepBibleViewModel().gingerSyrup),
                                           CocktailIngredient(.fortifiedWines(.cocchiAmericano), value: 0.5),
                                           CocktailIngredient(.gins(.ginAny), value: 1.5)]
                                        

let sunnySideTags = Tags(profiles: [.herbal, .refreshing, .light, .restorative],
                      styles: [.sour, .shaken])

let sunnySideBuild =  Build(instructions: [Instruction(step: 1, method: "Use Kold draft or Hoshizake cubes and the mint will the muddled while you're shaking."),
                                           Instruction(step: 2, method: "Double strain the shaken cocktail over a big rock."),
                                           Instruction(step: 3, method: "Garnish with a mint bouquet.")])

