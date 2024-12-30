//
//  SilverLining.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var silverLining  = Cocktail(cocktailName: "Silver Lining",
                             glasswareType: .collins,
                             garnish: nil,
                             ice: .columnIce,
                             author: Author(person: AuthorNames.josephSchwartz.rawValue,
                                            place: AuthorPlaces.milkAndHoney.rawValue,
                                            year: "2001"),
                             spec: silverLiningSpec,
                             buildOrder: silverLiningBuild,
                             tags: silverLiningTags,
                             variation: nil,
                             collection: .milkAndHoney)

var silverLiningSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                         OldCocktailIngredient(.otherNonAlc(.eggWhites), value: 1, unit: .whole),
                         OldCocktailIngredient(.liqueurs(.licor43), value: 0.75),
                         OldCocktailIngredient(.whiskies(.ryeWhiskeyAny), value: 1.5),
                         OldCocktailIngredient(.soda(.sodaWater) , value: 6)]



var silverLiningTags   = Tags(profiles: [.citrusy, .light, .silky, .effervescent],
                              styles: [.collins, .shaken])

