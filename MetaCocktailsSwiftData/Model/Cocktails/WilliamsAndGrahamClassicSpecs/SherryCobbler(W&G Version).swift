//
//  SherryCobbler (W&G Version).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/31/24.
//

import Foundation

var sherryCobblerWnG = Cocktail(cocktailName: "Sherry Cobbler" + wAndGTitleTag,
                                glasswareType: .wineGlass,
                                garnish: [.seasonalBerries, .mintSprig],
                                ice: .pebbleIce,
                                spec: sherryCobblerWnGSpec,
                                buildOrder: sherryCobblerWnGBuild,
                                tags: sherryCobblerWnGTags,
                                variation: .sherryCobbler,
                                collection: .williamsAndGraham)

let sherryCobblerWnGSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.fruit(.seasonalBerries), value: 5, unit: .muddled),
                                                  OldCocktailIngredient(.fruit(.orangeMoons), value: 2, unit: .muddled),
                                                  OldCocktailIngredient(.juices(.lemon), value: 0.25),
                                                  OldCocktailIngredient(.fortifiedWines(.lustauAmontillado), value: 2.5),
                                                  OldCocktailIngredient(.fortifiedWines(.lustauPX), value: 0.5)]

let sherryCobblerWnGBuild = Build(instructions: [Instruction(step: 1, method: "Muddle 4-6 seasonal berries and 2 orange moons."),
                                                 Instruction(step: 2, method: "Add the rest of your ingredients and shake."),
                                                 Instruction(step: 3, method: "Double strain over pebble ice and then garnish.")])

let sherryCobblerWnGTags = Tags(flavors: [.mint, .blackberry, .raspberry, .strawberry],
                                profiles: [.refreshing, .fruity, .dry, .restorative],
                                styles: [.sour, .shaken])

