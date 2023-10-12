//
//  French75Cognac.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI

var french75Cognac  = Cocktail(name: "French 75 (Arnaud's French 75 Version)",
                         imageName: "empty-Cocktail",
                         glasswareType: .flute,
                               garnish: [GarnishCatalog.noGarnish.asset],
                         ice: nil,
                         author: nil,
                         spec: french75CognacSpec,
                         buildOrder: french75CognacBuild,
                         tags: french75CognacTags)

var french75CognacSpec  = [CocktailIngredient(name: .lemon, value: 0.25, unit: .fluidOunces), 
                           CocktailIngredient(name: .simple, value: 0.25, unit: .fluidOunces),
                           CocktailIngredient(name: .VSOPCognac, value: 1.25, unit: .fluidOunces),
                           CocktailIngredient(name:.champagne , value: 2.5, unit: .fluidOunces)]

var french75CognacBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"), 
                                                Instruction(step: 2, method: "strain into the flute and top with Champagne"),
                                                Instruction(step: 3, method: "Give a gentle stir")])

var french75CognacTags   = Tags(flavors: [.lemon],
                                profiles: [.citrusy, .fruity],
                                textures: [.effervescent, .light],
                                styles: [.fizz, .shaken],
                                baseComponents: [.VSOPCognac])
