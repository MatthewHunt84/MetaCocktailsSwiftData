//
//  LongWayDown.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation


var longWayDown = Cocktail(cocktailName: "Long Way Down",
                           glasswareType: .collins,
                           garnish: [.mintSprig],
                           ice: .pebbleIce,
                           author: Author(person: AuthorNames.allisonWiddecombe.rawValue, place: AuthorPlaces.williamsAndGraham.rawValue),
                           spec: longWayDownSpec,
                           buildOrder: longWayDownBuild,
                           tags: longWayDownTags,
                           collection: .williamsAndGraham)

let longWayDownSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                                             OldCocktailIngredient(.bitters(.angosturaBitters), value: 2, unit: .dashes),
                                             OldCocktailIngredient(.syrups(.orgeat), value: 0.5, prep: PrepBible.orgeat),
                                             OldCocktailIngredient(.liqueurs(.allspiceDram), value: 1, unit: .barSpoon),
                                             OldCocktailIngredient(.liqueurs(.velvetFalernum), value: 0.75),
                                             OldCocktailIngredient(.rums(.appleton12), value: 1),
                                             OldCocktailIngredient(.rums(.smithAndCross), value: 1)]


let longWayDownTags = Tags(flavors: [.mint],
                           profiles: [.complex, .nutty, .citrusy, .refreshing],
                           styles: [.sour, .shaken, .tiki])



