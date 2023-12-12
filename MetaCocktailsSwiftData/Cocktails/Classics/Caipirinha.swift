//
//  Caipirinha.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/8/23.
//

import SwiftUI

var caipirinha   = Cocktail(cocktailName: "Caipirinha",
                            glasswareType: .doubleOld,
                            garnish: [.noGarnish],
                            ice: .koldDraft,
                            author: "Brazil",
                            spec: caipirinhaSpec,
                            buildOrder: caipirnhaBuild,
                            tags: caipirnhaTags)


var caipirinhaSpec = [CocktailIngredient(.lime, value: 2, unit: .limeQuarters),
                      CocktailIngredient(.granulatedSugar , value: 1.5, unit: .teaspoons),
                      CocktailIngredient(.cachaca, value: 2)]
                      
                      

var caipirnhaBuild = Build(instructions: [Instruction(step: 1, method: "Cut half of a lime into 6 pieces and add the pieces into a tin along with the sugar. Simple syrup works as well(.75 oz)."), 
                                          Instruction(step: 2, method: "Muddle until you get all the juice out of the lime. granulated sugar helps extract the oils from the lime skin."),
                                          Instruction(step: 3, method: "Add the Cachaca and ice and shake with vigor! This is a cocktail that does well with a little extra shaking"),
                                          Instruction(step: 4, method: "Pour all of the contents of the tin into your double old fashioned glass and serve with a straw.")])

var caipirnhaTags  = Tags(flavors: [.lime],
                          profiles: [.sweet, .citrusy],
                          textures: [.light, .unrefined],
                          styles: [.sour, .shaken],
                          rum: [.cachaca])
                         
