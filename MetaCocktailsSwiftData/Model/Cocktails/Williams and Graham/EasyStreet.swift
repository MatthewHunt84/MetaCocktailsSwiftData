//
//  EasyStreet.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var easyStreet = Cocktail(cocktailName: "Easy Street",
                          imageAsset: nil,
                          glasswareType: .doubleOld,
                          garnish: [.mintSprig, .blackberry, .raspberry],
                          ice: .pebbleIce,
                          author: williamsAndGraham ,
                          spec: easyStreetSpec,
                          buildOrder: easyStreetBuild,
                          tags: easyStreetTags,
                          collection: .williamsAndGraham)

let easyStreetSpec: [CocktailIngredient] = [CocktailIngredient(.syrups(.simple), value: 0.5),
                                            CocktailIngredient(.juices(.lemon), value: 0.75),
                                            CocktailIngredient(.fruit(.blackBerry), value: 1, unit: .muddled),
                                            CocktailIngredient(.fruit(.raspberries), value: 1, unit: .muddled),
                                            CocktailIngredient(.fortifiedWines(.byrrh), value: 0.75),
                                            CocktailIngredient(.gins(.woodyCreekGin), value: 1.5),
                                            CocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                            CocktailIngredient(.fortifiedWines(.sandemanPort), value: 0.25, unit: .float)]

let easyStreetTags = Tags(flavors: [.lemon],
                          profiles: [.fruity, .light, .herbal],
                          styles: [.sour, .shaken])

let easyStreetBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 1 blackberries and 1 raspberry."),
                                            Instruction(step: 2, method: "Add your ingredients and shake with ice."),
                                            Instruction(step: 3, method: "Double strain over crushed ice."),
                                            Instruction(step: 3, method: "Float peychaud's and port."),
                                            Instruction(step: 4, method: "Garnish with mint sprig and berries.")])

