//
//  HottToddy(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotToddyWnG = Cocktail(cocktailName: "Hot Toddy" + wAndGTitleTag,
                           glasswareType: .toddyGlass,
                           garnish: [.lemonWheel],
                           author: williamsAndGraham,
                           spec: hotToddyWnGSpec,
                           buildOrder: hotToddyWnGBuild,
                           tags: hotToddyWnGTags,
                           variation: .hotToddy,
                           collection: .williamsAndGraham,
                           titleCocktail: true)

var hotToddyWnGSpec  = [OldCocktailIngredient(.otherNonAlc(.hotWater), value: 2),
                        OldCocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                        OldCocktailIngredient(.juices(.lemon), value: 0.25),
                        OldCocktailIngredient(.whiskies(.larcenyBourbon), value: 2)]

var hotToddyWnGTags = Tags(flavors: [.lemon, .tea],
                           profiles: [.hot],
                           styles: [.toddy])

