//
//  LongWayDown.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var longWayDown = Cocktail(cocktailName: "Long Way Down",
                           imageAsset: nil,
                           glasswareType: .collins,
                           garnish: [.mintSprig],
                           ice: .pebbleIce,
                           author: justWnG,
                           spec: longWayDownSpec,
                           buildOrder: longWayDownBuild,
                           tags: longWayDownTags,
                           collection: .williamsAndGraham)

let longWayDownSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.75),
                                             CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                             CocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                             CocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .barSpoon),
                                             CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.75),
                                             CocktailIngredient(.rums(.appleton12), value: 1),
                                             CocktailIngredient(.rums(.smithAndCross), value: 1)]


let longWayDownTags = Tags(profiles: [.complex, .nutty, .citrusy, .refreshing],
                           styles: [.sour, .shaken, .tiki])


let longWayDownBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except the bitters, into a tin and shake with ice."),
                                            Instruction(step: 2, method: "Strain into a collins glass and then fill the glass with pebble ice."),
                                            Instruction(step: 3, method: "Add a mint sprig for garnish and float the bitters on top of the ice.")])
