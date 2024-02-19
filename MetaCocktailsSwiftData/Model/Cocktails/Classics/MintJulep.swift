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
                         author: Author(person: "Old as Fuck."),
                         spec: mintJulepSpec,
                         buildOrder: mintJulepBuild,
                         tags: mintJulepTags,
                         variation: .mintJulep)

let mintJulepSpec: [CocktailIngredient] = [CocktailIngredient(.herbs(.mint), value: 10, unit: .gentlyMuddled),
                                           CocktailIngredient(.syrups(.simple), value: 1),
                                           CocktailIngredient(.whiskies(.bourbonAny), value: 3)]

let mintJulepTags = Tags(profiles: [.herbal, .sweet, .refreshing],
                         styles: [.julep, .built])

let mintJulepBuild =  Build(instructions: [Instruction(step: 0, method: "Note: This is a style of cocktail that came from a long rich history of the 'Julep' dating back tot eh early 1700s. This whiskey version didn't come to prominence until the mid 1800s. The Kentucky Derby didn't claim it until the 1930's. Ok, back to the cocktail..."),
                                           Instruction(step: 1, method: "In Highball or Julep cup, gently muddle 8-10 mint leaves along with the simple syrup. Don't break the leaves apart here. You only want to release the oils. If you break apart the leaves, you get a more bitter taste because of the chlorophyll."),
                                           Instruction(step: 2, method: "Add crushed or pebble ice and then add the spirit of choice. Cognac or Armagnac was common during it's conception but American whiskey has become more popular in recent years."),
                                           Instruction(step: 3, method: "Use a swizzle stick or barspoon to stir until the outside of the glass starts to get frosty."),
                                           Instruction(step: 4, method: "add ice to the rim of the cup and stir a couple of more times."),
                                           Instruction(step: 5, method: "add the straw and then snow cone the top of the cocktail with ice so that the straw does not disturb the ice on top. Optional: Float funky Jamaican rum and use french brandy as a base!"),
                                           Instruction(step: 6, method: "Garnish with a mint bouquet. Optional: Top mint with powdered sugar")])

