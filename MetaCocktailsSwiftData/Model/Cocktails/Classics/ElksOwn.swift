//
//  ElksOwn.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation


var elksOwnCocktail = Cocktail(cocktailName: "Elk's Own Cocktail",
                               glasswareType: .stemmedGlassware,
                               garnish: [.pineappleWedge],
                               author: harryCraddock,
                               spec: elksOwnCocktailSpec,
                               buildOrder: elksOwnCocktailBuild,
                               tags: elksOwnCocktailTags,
                               variation: .elksClubFizz,
                               collection: .originals,
                               titleCocktail: true)

var elksOwnCocktailSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                            OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                            OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .teaspoon),
                            OldCocktailIngredient(.fortifiedWines(.portWine), value: 1),
                            OldCocktailIngredient(.whiskies(.canadianWhiskeyAny), value: 1)]




var elksOwnCocktailTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                               styles: [.sour, .shaken])

