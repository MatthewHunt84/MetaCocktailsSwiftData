//
//  airMail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var airMail  = Cocktail(cocktailName: "Air Mail",
                         glasswareType: .smallHighball,
                         garnish: [.noGarnish],
                         spec: airMailSpec,
                         buildOrder: airMailBuild,
                         tags: airMailTags)

var airMailSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                     CocktailIngredient(.syrups(.honeySyrup), value: 0.75),
                     CocktailIngredient(.rums(.rumAgedCuban), value: 1.5),
                     CocktailIngredient(.wines(.champagne) , value: 2)]

var airMailBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                          Instruction(step: 2, method: "Add Champagne to the glass first!"),
                                          Instruction(step: 3, method: "Then add the shaken cocktail to that.")])

var airMailTags   = Tags(profiles: [.citrusy],
                          textures: [.effervescent, .light],
                          styles: [.shaken, .fizz])
                          
