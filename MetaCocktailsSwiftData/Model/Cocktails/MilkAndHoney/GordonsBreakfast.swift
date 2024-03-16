//
//  GordonsBreakfast.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/12/24.
//

import Foundation

var gordonsBreakfast = Cocktail(cocktailName: "Gordon's Breakfast",
                                glasswareType: .doubleOld,
                                garnish: [.pinchSalt, .pinchPepper],
                                ice: .koldDraft,
                                author:Author(person: AuthorNames.carolynGil.rawValue ,place: AuthorPlaces.milkAndHoney.rawValue , year: "Early 2000s"),
                                spec: gordonsBreakfastSpec,
                                buildOrder: gordonsBreakfastBuild,
                                tags: gordonsBreakfastTags,
                                collection: .milkAndHoney)

var gordonsBreakfastSpec     =  [CocktailIngredient(.seasoning(.salt), value: 1, unit: .pinch),
                                 CocktailIngredient(.seasoning(.pepper), value: 1, unit: .pinch),
                                 CocktailIngredient(.otherNonAlc(.worcestershire), value: 2, unit: .dashes),
                                 CocktailIngredient(.otherNonAlc(.cholula), value: 4, unit: .dashes),
                                 CocktailIngredient(.fruit(.cucumberSlices), value: 3, unit: .muddled),
                                 CocktailIngredient(.fruit(.limeWedges), value: 6, unit: .muddled),
                                 CocktailIngredient(.syrups(.simple), value: 0.75),
                                 CocktailIngredient(.gins(.ginLondonDry), value: 2),]

var gordonsBreakfastTags     = Tags(profiles: [.savory, .refreshing, .citrusy, .complex, .spicy, .restorative],
                                    styles: [.sour, .shaken])

var gordonsBreakfastBuild = Build(instructions: [Instruction(step: 1, method: "Combine all ingredients in a cocktail shaker."),
                                                 Instruction(step: 2, method: "Add 1 cup (240 ml) cracked ice and shake vigorously until the drink is sufficiently chilled."),
                                                 Instruction(step: 3, method: "Pour into a chilled rocks glass. "),
                                                 Instruction(step: 4, method: "Finish with a pinch each of salt and freshly ground pepper.")])
