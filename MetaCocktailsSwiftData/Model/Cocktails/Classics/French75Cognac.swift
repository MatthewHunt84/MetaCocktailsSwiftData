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
                               author: Author(person: "Arnaud's French 75", place: "New Orleans"),
                               spec: french75CognacSpec,
                               buildOrder: topWithChampagnMethod,
                               tags: french75CognacTags,
                               variation: .french75)

var french75CognacSpec  = [OldCocktailIngredient(.juices(.lemon), value: 0.25),
                           OldCocktailIngredient(.syrups(.simple), value: 0.25, prep: PrepBible.simpleSyrupPrep),
                           OldCocktailIngredient(.brandies(.cognacVSOP), value: 1.25),
                           OldCocktailIngredient(.wines(.champagne), value: 2.5)]



var french75CognacTags   = Tags(flavors: [.lemon],
                                profiles: [.citrusy, .effervescent, .light],
                                styles: [.fizz, .shaken, .fizz])

