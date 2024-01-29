//
//  SmokingMonkey.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/20/24.
//

import Foundation


var smokingMonkey = Cocktail(cocktailName: "Smoking Monkey",
                             imageAsset: nil,
                             glasswareType: .stemmedGlassware,
                             garnish: [.angoDeco, .peychaudsDeco],
                             author:Author(person: AuthorNames.jamesMenkal.rawValue,
                                           place: AuthorPlaces.williamsAndGraham.rawValue),
                             spec: smokingMonkeySpec,
                             buildOrder: smokingMonkeyBuild,
                             tags: smokingMonkeyTags)

let smokingMonkeySpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.gingerSyrup), value: 0.25),
                                               CocktailIngredient(.juices(.lemon), value: 0.5),
                                               CocktailIngredient(.otherNonAlc(.eggWhites), value: 0.75),
                                               CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.25),
                                               CocktailIngredient(.liqueurs(.strega), value: 0.5),
                                               CocktailIngredient(.whiskies(.Ardbeg), value: 0.5),
                                               CocktailIngredient(.gins(.monkey47), value: 1)]


let smokingMonkeyTags = Tags(profiles: [.herbal, .refreshing, .complex, .silky],
                      styles: [.sour, .shaken])

let smokingMonkeyBuild =  Build(instructions: [Instruction(step: 1, method: "Add all ingredients except the biters and dry shake."),
                                               Instruction(step: 2, method: "Shake with ice."),
                                               Instruction(step: 3, method: "Double strain the shaken cocktail into a stemmed glassware."),
                                               Instruction(step: 4, method: "Decorate with a design of Angostura and Peychaud's bitters."),
                                               Instruction(step: 5, method: "The original cocktail had a rice paper cut-out of a smoking monkey where the bitters were the smoke design.")])

