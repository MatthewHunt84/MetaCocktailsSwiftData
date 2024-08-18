//
//  FourInHand.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 8/17/24.
//

import Foundation


var fourInHand = Cocktail(cocktailName: "Four in Hand",
                          imageAsset: nil,
                          glasswareType: .doubleOld,
                          garnish: [.orangePeel],
                          ice: .bigRock,
                          author: Author(person: AuthorNames.scottTeague.rawValue,
                                         place: AuthorPlaces.deathAndCo.rawValue,
                                         year: "2013"),
                          spec: fourInHandSpec,
                          tags: fourInHandTags,
                          collection: .deathAndCo)

let fourInHandSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.syrups(.vanilla), value: 1, unit: .teaspoon, prep: PrepBible.vanillaSyrup),
                                               OldCocktailIngredient(.syrups(.cinnamonSyrup), value: 1, unit: .teaspoon, prep: PrepBible.cinnamonSyrup),
                                               OldCocktailIngredient(.rums(.smithAndCross), value: 0.25),
                                               OldCocktailIngredient(.liqueurs(.greenChartreuse), value: 0.25),
                                               OldCocktailIngredient(.brandies(.lairdsBonded), value: 0.75),
                                               OldCocktailIngredient(.whiskies(.oGD114), value: 0.75)]


let fourInHandTags = Tags(flavors: [.orange],
                          profiles: [.spiritForward, .complex, .herbal],
                          styles: [.oldFashioned, .stirred, .tiki])

