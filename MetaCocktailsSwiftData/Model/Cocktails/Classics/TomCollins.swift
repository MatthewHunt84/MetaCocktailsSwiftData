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
                           notes: tomCollinsNote,
                           tags: tomCollinsTags,
                           variation: .tomCollins,
                           titleCocktail: true)

var tomCollinsSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.75),
                       OldCocktailIngredient(.syrups(.simple), value: 1, prep: PrepBible.simpleSyrupPrep),
                       OldCocktailIngredient(.gins(.fordsGin), value: 1.5),
                       OldCocktailIngredient(.soda(.sodaWater) , value: 2)]



var tomCollinsTags   = Tags(flavors: [.lemon],
                            profiles: [.citrusy, .floral, .effervescent, .light],
                            styles: [.collins, .shaken, .fizz])
