//
//  HouseBramble.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var houseBramble = Cocktail(cocktailName: "Bramble" + houseTag,
                            imageAsset: nil,
                            glasswareType: .doubleOld,
                            garnish: [.blackberry, .raspberry],
                            ice: .pebbleIce,
                            spec: houseBrambleSpec,
                            buildOrder: houseBrambleBuild,
                            tags: brambleTags,
                            variation: .bramble,
                            collection: .house)

let houseBrambleSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.raspberries), value: 3, unit: .whole),
                                                 OldCocktailIngredient(.fruit(.blackBerry), value: 3, unit: .whole),
                                                 OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                 OldCocktailIngredient(.syrups(.simple), value: 0.75, prep: PrepBible.simpleSyrupPrep),
                                                 OldCocktailIngredient(.liqueurs(.cremeDeCassis), value: 0.25),
                                                 OldCocktailIngredient(.gins(.fordsGin), value: 2)]

let houseBrambleBuild =  Build(instructions: [Instruction(step: 1, method: "Muddle blackberries and raspberries."),
                                              Instruction(step: 2, method: "Shake all the ingredients with ice."),
                                              Instruction(step: 3, method: "Strain into a double old fashioned glass and add pebble ice."),
                                              Instruction(step: 4, method: "Garnish with skewered blackberries and raspberries.")])


var houseTag = ""
