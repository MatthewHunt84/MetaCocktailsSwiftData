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
                               collection: .originals, titleCocktail: true)

var elksOwnCocktailSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                            OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1),
                            OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 1, unit: .teaspoon),
                            OldCocktailIngredient(.fortifiedWines(.portWine), value: 1),
                            OldCocktailIngredient(.whiskies(.canadianWhiskeyAny), value: 1)]

var elksOwnCocktailBuild = Build(instructions: [Instruction(step: 1, method: "Add all ingredients and dry shake."),
                                                Instruction(step: 2, method: "Add a few Kold Draft cubes and shake until cold."),
                                                Instruction(step: 3, method: "Strain into a chilled stemmed glass.")])


var elksOwnCocktailTags = Tags(profiles: [.citrusy, .fruity, .light, .silky],
                               styles: [.sour, .shaken])

