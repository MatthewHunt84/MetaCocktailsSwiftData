////
////  BeckyWithTheGoodHair.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/24/23.
////

import SwiftUI

var beckyWithTheGoodHair = Cocktail(cocktailName: "Becky With The Good Hair",
                                    glasswareType: .snifter,
                                    garnish: [.nutmeg],
                                    ice: nil,
                                    author: Author(person: AuthorNames.saydeeCanada.rawValue,
                                                   place: AuthorPlaces.williamsAndGraham.rawValue,
                                                   year: "2016"),
                                    spec: beckyWithTheGoodHairSpec,
                                    buildOrder: beckyWithTheGoodHairBuild,
                                    tags: beckyWithTheGoodHairTags,
                                    collection: .williamsAndGraham)

var beckyWithTheGoodHairSpec  = [OldCocktailIngredient(.brandies(.cognacVSOP), value: 0.75),
                                 OldCocktailIngredient(.amari(.becherovka), value: 0.75),
                                 OldCocktailIngredient(.amari(.fernetBrancaMenta), value: 0.75),
                                 OldCocktailIngredient(.liqueurs(.cremeDeCacao), value: 0.75),
                                 OldCocktailIngredient(.otherNonAlc(.eggWhole), value: 1, unit: .whole)]

var beckyWithTheGoodHairTags = Tags(flavors: [.nutmeg, .mint, .chocolate],
                                    profiles: [.rich, .silky, .savory],
                                    styles: [.flip, .shaken])


