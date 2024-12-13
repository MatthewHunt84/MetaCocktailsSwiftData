//
//  HouseBramble.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 10/14/24.
//

import Foundation

var houseBramble = Cocktail(cocktailName: "Bramble" + houseTag,
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




var houseTag = ""
