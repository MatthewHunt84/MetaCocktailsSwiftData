//
//  HotBrandyToddy(JT).swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/28/24.
//

import Foundation

var hotBrandyToddy = Cocktail(cocktailName: "Hot Brandy Toddy" + historicTag,
                              glasswareType: .toddyGlass,
                              garnish: [.nutmeg],
                              author: jerryThomas,
                              spec: hotBrandyToddySpec,
                              buildOrder: hotToddyWnGBuild,
                              tags: hotBrandyToddyTags,
                              variation: .hotToddy,
                              collection: .originals,
                              historicSpec: .hotToddy)

var hotBrandyToddySpec  = [OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .teaspoon),
                           OldCocktailIngredient(.otherNonAlc(.hotWater), value: 3),
                           OldCocktailIngredient(.brandies(.brandyAny), value: 2)]

var hotBrandyToddyTags = Tags(flavors: [.tea, .nutmeg],
                              profiles: [.hot],
                              styles: [.toddy])

var hotBrandyToddyBuild = Build(instructions: [Instruction(step: 1, method: "Place and sugar in a small shaker tin. "),
                                               Instruction(step: 2, method: "Fill the large shaker tin half full of near boiling water then float the small tin on top, bain-marie style."),
                                               Instruction(step: 3, method: "At the same time, heat your toddy glass up by adding hot water to it."),
                                               Instruction(step: 4, method: "After your sugar is dissolved, add the brandy. When all the ingredients are hot enough, dump the old water from the toddy glass and pour in the heated cocktail. ")])
