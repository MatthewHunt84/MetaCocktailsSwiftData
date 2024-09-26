////
////  Cosmopolitan.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI


var cosmopolitan  = Cocktail(cocktailName: "Cosmopolitan",
                             glasswareType: .martini,
                             garnish: [.orangePeel],
                             ice: nil,
                             author:Author(person: "Toby Cecchini",
                                           place: "Odeon, Tribeca",
                                           year: "1988"),
                             spec: cosmoSpec,
                             buildOrder: nil,
                             notes: cosmoNotes,
                             tags: cosmoTags)

var cosmoSpec  = [OldCocktailIngredient(.juices(.lime), value: 0.25),
                  OldCocktailIngredient(.juices(.cranberryJuice), value: 1),
                  OldCocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                  OldCocktailIngredient(.vodkas(.vodkaCitrus), value: 1.5)]

var cosmoTags  = Tags(flavors: [.orange, .cranberry, .lime],
                      profiles: [.fruity, .citrusy, .light],
                      styles: [.daisy, .shaken, .sour])
                     
var cosmoNotes = "While this cocktail originated in the 1980s, its popularity surged in the early 2000s during the cocktail renaissance, thanks in large part to Dale DeGroff's influence at New York's Rainbow Room. The HBO series 'Sex and the City' also played a substantial role in boosting its fame. Regardless of its origins, it's undeniable that this drink has firmly established itself in the pantheon of modern cocktails."
