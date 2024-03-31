//
//  HottToddy(WnG).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotToddyWnG = Cocktail(cocktailName: "Hot Toddy (W&G Version)",
                           glasswareType: .toddyGlass,
                           garnish: [.lemonWheel],
                           author: williamsAndGraham,
                           spec: hotToddyWnGSpec,
                           buildOrder: hotToddyWnGBuild,
                           tags: hotToddyWnGTags,
                           variation: .hotToddy,
                           collection: .williamsAndGraham,
                           titleCocktail: true)

var hotToddyWnGSpec  = [CocktailIngredient(.otherNonAlc(.hotWater), value: 2),
                        CocktailIngredient(.syrups(.honeySyrup), value: 0.5, prep: PrepBible.honeySyrup),
                        CocktailIngredient(.juices(.lemon), value: 0.25),
                        CocktailIngredient(.whiskies(.larcenyBourbon), value: 2)]

var hotToddyWnGTags = Tags(flavors: [.lemon, .tea],
                           profiles: [.hot, .comforting],
                           styles: [.toddy])

var hotToddyWnGBuild = Build(instructions: [Instruction(step: 1, method: "Place all ingredients except the hot water in a small shaker tin. "),
                                            Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                            Instruction(step: 3, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                            Instruction(step: 4, method: "After your ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail. "),
                                            Instruction(step: 5, method: "Then top it off with fresh hot water and garnish.")])
