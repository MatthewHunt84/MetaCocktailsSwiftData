//
//  AsburyParkSwizzle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var asburyParkSwizzle = Cocktail(cocktailName: "Asbury Park Swizzle",
                                 glasswareType: .collins,
                                 garnish: [.mintSprig],
                                 ice: .pebbleIce,
                                 author: Author(person: AuthorNames.sashaPetraske.rawValue ,
                                                place: AuthorPlaces.milkAndHoney.rawValue,
                                                year: "Early 2000s"),
                                 spec: asburyParkSwizzleSpec,
                                 buildOrder: asburyParkSwizzleBuild ,
                                 tags: asburyParkSwizzleTags,
                                 variation: nil,
                                 collection: .milkAndHoney,
                                 titleCocktail: false)

let asburyParkSwizzleSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                                   OldCocktailIngredient(.seasoning(.mineralSaline), value: 2, unit: .drops, prep: PrepBible.mineralSaline),
                                                   OldCocktailIngredient(.bitters(.aPPBitters), value: 5, unit: .dashes, prep: PrepBible.aPPBitters),
                                                   OldCocktailIngredient(.bitters(.houseOrangeBitters), value: 1, unit: .dashes, prep: PrepBible.houseOrangeBitters),
                                                   OldCocktailIngredient(.juices(.lemon), value: 0.75),
                                                   OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                                                   OldCocktailIngredient(.liqueurs(.berentzenApple), value: 0.25),
                                                   OldCocktailIngredient(.brandies(.lairdsJersey), value: 2)]

let asburyParkSwizzleTags = Tags(profiles: [.herbal, .refreshing, .light],
                                 styles: [.sour, .shaken])


