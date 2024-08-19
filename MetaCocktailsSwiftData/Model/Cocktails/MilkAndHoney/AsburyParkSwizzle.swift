//
//  AsburyParkSwizzle.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/15/24.
//

import Foundation

var asburyParkSwizzle = Cocktail(cocktailName: "Asbury Park Swizzle",
                                 imageAsset: nil,
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

var asburyParkSwizzleBuild = Build(instructions: [Instruction(step: 1, method: "Combine two mint sprigs, lemon juice, honey syrup, and apple liqueur in a cocktail shaker and gently muddle."),
                                                  Instruction(step: 2, method: "Add the applejack and mineral saline, then swirl to incorporate."),
                                                  Instruction(step: 3, method: "Pour the cocktail into a collins glass and add crushed ice to come just under the rim of the glass."),
                                                  Instruction(step: 4, method: "Add both bitters and lightly swizzle the drops into a red layer on top of the ice."),
                                                  Instruction(step: 5, method: "Top with more ice, shaping it into a cone, and garnish with a mint sprig.")])
