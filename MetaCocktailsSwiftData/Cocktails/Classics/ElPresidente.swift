////
////  ElPresidente.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/10/23.
////

import SwiftUI


var elPresidente  = Cocktail(cocktailName: "El Presidente",
                             glasswareType: .coupe,
                             garnish: [.orangePeel, .maraschinoCherry],
                             ice: nil,
                             author: "Constante Ribalaiuga",
                             spec: elPresidenteSpec,
                             buildOrder: nil,
                             tags: elPresidenteTags)

var elPresidenteSpec  = [CocktailIngredient(.rums(.rumWhite), value: 1.5),
                         CocktailIngredient(.fortifiedWines(.blancVermouth), value: 1.5),
                         CocktailIngredient(.liqueurs(.orangeCuracao) , value: 1, unit: .barspoon),
                         CocktailIngredient(.syrups(.grenadine), value: 0.5, unit: .barspoon)]

var elPresidenteTags  = Tags(flavors: [.orange, .pomegranate],
                             profiles: [.aromatic, .fruity, .spiritForward],
                             textures: [.rich],
                             styles: [.martini, .stirred])
                             
