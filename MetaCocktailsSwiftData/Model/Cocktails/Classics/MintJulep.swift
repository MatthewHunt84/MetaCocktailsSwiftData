//
////  MintJulep.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var mintJulep = Cocktail(cocktailName: "Mint Julep",
                         imageAsset: nil,
                         glasswareType: .julep,
                         garnish: [.mintBouquet],
                         ice: .pebbleIce,
                         author: Author(person: "One of the oldest cocktails to exist. See build order."),
                         spec: mintJulepSpec,
                         buildOrder: mintJulepBuild,
                         tags: mintJulepTags,
                         variation: .mintJulep,
                         collection: .originals,
                         titleCocktail: true)

let mintJulepSpec: [OldCocktailIngredient] = [OldCocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                           OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                                              OldCocktailIngredient(.whiskies(.bourbonAny), value: 2.5)]

let mintJulepTags = Tags(profiles: [.herbal, .sweet, .refreshing],
                         styles: [.julep, .built])

let mintJulepBuild =  Build(instructions: [Instruction(step: 0, method: "Note: This is a style of cocktail that came from a long rich history of the 'Julep' dating back to the early 1700s. This whiskey version didn't come to prominence until the mid 1800s. The Kentucky Derby didn't claim it until the 1930's. That being said, this cocktail is almost impossible to credit one person or place for its invention. "),
                                           Instruction(step: 1, method: "In a highball or julep cup, gently muddle 8-10 mint leaves along with the simple syrup. I mean very gently."),
                                           Instruction(step: 2, method: "Add crushed or pebble ice and then add the spirit of choice. Cognac or Armagnac was common during it's conception but American whiskey has become more popular in recent years."),
                                           Instruction(step: 3, method: "Use a swizzle stick or bar spoon to stir until the outside of the glass starts to get frosty."),
                                           Instruction(step: 4, method: "add ice to the rim of the cup and stir a couple of more times."),
                                           Instruction(step: 5, method: "add the straw and then snow cone the top of the cocktail with ice so that the straw does not disturb the ice on top. Optional: Float funky Jamaican rum and use french brandy as a base!"),
                                           Instruction(step: 6, method: "Garnish with a mint bouquet. Optional: Top mint with powdered sugar")])

