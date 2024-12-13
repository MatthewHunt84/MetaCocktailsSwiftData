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


