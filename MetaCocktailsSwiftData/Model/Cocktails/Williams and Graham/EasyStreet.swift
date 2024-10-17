//
//  EasyStreet.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var easyStreet = Cocktail(cocktailName: "Easy Street",
                          glasswareType: .doubleOld,
                          garnish: [.mintSprig, .blackberry, .raspberry],
                          ice: .pebbleIce,
                          author: Author(person: AuthorNames.chadLarson.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue) ,
                          spec: easyStreetSpec,
                          buildOrder: easyStreetBuild,
                          tags: easyStreetTags,
                          collection: .williamsAndGraham)

let easyStreetSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                                            OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                            OldCocktailIngredient(.fruit(.blackBerry), value: 1, unit: .muddled),
                                            OldCocktailIngredient(.fruit(.raspberries), value: 1, unit: .muddled),
                                            OldCocktailIngredient(.fortifiedWines(.byrrh), value: 0.75),
                                            OldCocktailIngredient(.gins(.woodyCreekGin), value: 1.5),
                                            OldCocktailIngredient(.bitters(.peychauds), value: 2, unit: .dashes),
                                            OldCocktailIngredient(.fortifiedWines(.sandemanPort), value: 0.25)]

let easyStreetTags = Tags(flavors: [.lemon, .mint],
                          profiles: [.fruity, .light, .herbal],
                          styles: [.sour, .shaken])

let easyStreetBuild =  Build(instructions: [Instruction(step: 1, method: "In a tin, muddle 1 blackberries and 1 raspberry."),
                                            Instruction(step: 2, method: "Add all ingredients, except for bitters and port, and shake with ice."),
                                            Instruction(step: 3, method: "Double strain over crushed ice in a double old fashioned glass."),
                                            Instruction(step: 3, method: "Float peychaud's and port."),
                                            Instruction(step: 4, method: "Garnish with mint sprig and berries.")])

