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
                             author:Author(person: "Cheryl Cook",
                                           place: "Miami"),
                             spec: cosmoSpec,
                             buildOrder: nil,
                             tags: cosmoTags)

var cosmoSpec  = [CocktailIngredient(.juices(.lime), value: 0.25),
                  CocktailIngredient(.juices(.cranberryJuice), value: 1),
                  CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                  CocktailIngredient(.vodkas(.vodkaCitrus), value: 1.5)]

var cosmoTags  = Tags(flavors: [.orange, .cranberry, .lime],
                      profiles: [.fruity, .citrusy],
                      textures: [.light],
                      styles: [.sour, .shaken])
                     
