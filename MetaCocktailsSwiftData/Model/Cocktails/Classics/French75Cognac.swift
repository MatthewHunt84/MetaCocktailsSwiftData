////
////  French75Cognac.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI

var french75Cognac  = Cocktail(cocktailName: "French 75 (Arnaud's French 75 Version)",
                               glasswareType: .flute,
                               garnish: [.noGarnish],
                               ice: nil,
                               author: nil,
                               spec: french75CognacSpec,
                               buildOrder: french75CognacBuild,
                               tags: french75CognacTags,
                               variation: .french75)

var french75CognacSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                           OldCocktailIngredient(.syrups(.simple), value: 0.25),
                           OldCocktailIngredient(.brandies(.cognacVSOP), value: 1.25),
                           OldCocktailIngredient(.wines(.champagne), value: 2.5)]

var french75CognacBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                                Instruction(step: 2, method: "strain into the flute and top with Champagne"),
                                                Instruction(step: 3, method: "Give a gentle stir")])

var french75CognacTags   = Tags(flavors: [.lemon],
                                profiles: [.citrusy, .effervescent, .light],
                                styles: [.fizz, .shaken, .fizz])

