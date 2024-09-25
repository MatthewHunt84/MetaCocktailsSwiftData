////
////  Caipirinha.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/8/23.
////

import SwiftUI

var caipirinha   = Cocktail(cocktailName: "Caipirinha",
                            glasswareType: .doubleOld,
                            ice: .koldDraft,
                            author:Author(place: "Brazil"),
                            spec: caipirinhaSpec,
                            buildOrder: caipirnhaBuild,
                            notes: caipirnhaNotes,
                            tags: caipirnhaTags)


var caipirinhaSpec = [OldCocktailIngredient(.fruit(.limeHalf), value: 1, unit: .none),
                      OldCocktailIngredient(.otherNonAlc(.granulatedSugar), value: 2, unit: .barSpoon),
                      OldCocktailIngredient(.syrups(.simple), value: 0.5, prep: PrepBible.simpleSyrupPrep),
                      OldCocktailIngredient(.rums(.cachaca), value: 2)]
                      
                      

var caipirnhaBuild = Build(instructions: [Instruction(step: 1, method: "Cut half of a lime into 6 pieces and add the pieces into a tin along with the sugar and simple."),
                                          Instruction(step: 2, method: "Muddle until you get all the juice out of the lime. granulated sugar helps extract the oils from the lime skin."),
                                          Instruction(step: 3, method: "Add the Cachaca and ice and shake with vigor! This is a cocktail that does well with a little extra shaking"),
                                          Instruction(step: 4, method: "Pour all of the contents of the tin into your double old fashioned glass and serve with a straw.")])

var caipirnhaTags  = Tags(flavors: [.lime],
                          profiles: [.sweet, .citrusy, .light],
                          styles: [.sour, .shaken])
                         
var caipirnhaNotes = "Caipirinha is the national drink of Brasil. Cachaça is a native Brazilian spirit distilled from juiced sugarcane."
