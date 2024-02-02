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
                           tags: longWayDownTags)

let longWayDownSpec: [CocktailIngredient] = [CocktailIngredient(.juices(.lime), value: 0.75),
                                             CocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .floatedDashes),
                                             CocktailIngredient(.syrups(.orgeat), value: 0.5),
                                             CocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .barSpoon),
                                             CocktailIngredient(.liqueurs(.velvetFalernum), value: 0.75),
                                             CocktailIngredient(.rums(.appleton12), value: 1),
                                             CocktailIngredient(.rums(.smithAndCross), value: 1)]


let longWayDownTags = Tags(profiles: [.complex, .nutty, .citrusy, .refreshing],
                           styles: [.sour, .shaken, .tiki])

