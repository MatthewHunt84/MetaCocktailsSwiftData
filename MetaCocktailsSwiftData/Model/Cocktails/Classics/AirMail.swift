//
//  airMail.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation

var airMail  = Cocktail(cocktailName: "Air Mail",
                        glasswareType: .fizzGlass,
                        garnish: [.noGarnish],
                        author: Author(person: "Bacardi and It's Many Uses.", place: "Santiago de Cuba", year: "1930"),
                        spec: airMailSpec,
                        buildOrder: airMailBuild,
                        tags: airMailTags,
                        variation: .airMail,
                        collection: .originals, 
                        titleCocktail: true)

var airMailSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.75),
                    OldCocktailIngredient(.syrups(.honeySyrup), value: 0.75, prep: PrepBible.honeySyrup),
                    OldCocktailIngredient(.rums(.rumAgedCuban), value: 1.5),
                    OldCocktailIngredient(.wines(.champagne) , value: 2)]

var airMailBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the Champagne, into a tin and shake with ice"),
                                         Instruction(step: 2, method: "Add Champagne to the glass first!"),
                                         Instruction(step: 3, method: "Then add the shaken cocktail to that.")])

var airMailTags   = Tags(profiles: [.citrusy, .effervescent, .light],
                         styles: [.shaken, .fizz])

