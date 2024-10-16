//
//  TomCollins.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/1/24.
//

import Foundation

var tomCollins  = Cocktail(cocktailName: "Tom Collins",
                           glasswareType: .collins,
                           garnish: [.lemonWheel],
                           ice: .koldDraft,
                           author: Author(person: "Unknown"),
                           spec: tomCollinsSpec,
                           buildOrder: tomCollinsBuild,
                           notes: tomCollinsNotes,
                           tags: tomCollinsTags,
                           variation: .tomCollins,
                           titleCocktail: true)

var tomCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                       OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                       OldCocktailIngredient(.gins(.fordsGin), value: 1.5),
                       OldCocktailIngredient(.soda(.sodaWater) , value: 2)]

var tomCollinsBuild  = Build(instructions: [Instruction(step: 1, method: "Add all ingredients, except for the soda, into a tin and shake with ice"),
                                            Instruction(step: 2, method: "strain over cracked ice and top with soda"),
                                            Instruction(step: 3, method: "Give a gentle stir")])

var tomCollinsTags   = Tags(flavors: [.lemon],
                            profiles: [.citrusy, .floral, .effervescent, .light],
                            styles: [.collins, .shaken, .fizz])
