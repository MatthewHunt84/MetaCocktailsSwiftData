//
//  Cosmopolitan.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI


var cosmopolitan  = Cocktail(cocktailName: "Cosmopolitan",
                             glasswareType: .martini,
                             garnish: [.orangePeel],
                             ice: nil,
                             author: "Cheryl Cook (Not Actually Dale DeGroff, but we still love Dale!)",
                             spec: cosmoSpec,
                             buildOrder: nil,
                             tags: cosmoTags)

var cosmoSpec  = [CocktailIngredient(.lime, value: 0.25),
                  CocktailIngredient(.cranberryJuice, value: 1),
                  CocktailIngredient(.cointreau, value: 0.75),
                  CocktailIngredient(.vodkaCitrus, value: 1.5)]
                  

var cosmoTags  = Tags(flavors: [.orange, .cranberry, .lime],
                      profiles: [.fruity, .citrusy],
                      textures: [.light],
                      styles: [.sour, .shaken],
                      bases: [.vodkaCitrus, .vodka, .cointreau])
