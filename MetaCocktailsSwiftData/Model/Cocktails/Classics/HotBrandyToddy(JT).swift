//
//  HotBrandyToddy(JT).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotBrandyToddy = Cocktail(cocktailName: "Hot Brandy Toddy",
                              glasswareType: .toddyGlass,
                              garnish: [.nutmeg],
                              author: jerryThomas,
                              spec: hotBrandyToddySpec,
                              buildOrder: hotToddyWnGBuild,
                              tags: hotBrandyToddyTags)

var hotBrandyToddySpec  = [CocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .teaspoon),
                           CocktailIngredient(.otherNonAlc(.hotWater), value: 3),
                           CocktailIngredient(.brandies(.brandyAny), value: 2)]

var hotBrandyToddyTags = Tags(flavors: [.tea],
                              profiles: [.hot],
                              styles: [.toddy])

var hotBrandyToddyBuild = Build(instructions: [Instruction(step: 1, method: "Place and sugar in a small shaker tin. "),
                                               Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                               Instruction(step: 3, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                               Instruction(step: 4, method: "After your sugar is dissolved, add the brandy. When all the ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail. ")])
