//
//  ElPresidente.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI


var elPresidente  = Cocktail(cocktailName: "El Presidente",
                             glasswareType: .coupe,
                             garnish: [.orangePeel, .maraschinoCherry],
                             ice: nil,
                             author: "Constante Ribalaiuga",
                             spec: elPresidenteSpec,
                             buildOrder: nil,
                             tags: elPresidenteTags)

var elPresidenteSpec  = [CocktailIngredient(.whiteRum, value: 1.5),
                         CocktailIngredient(.blancVermouth, value: 1.5),
                         CocktailIngredient(.orangeCuracao , value: 1, unit: .barspoon),
                         CocktailIngredient(.granadine, value: 0.5, unit: .barspoon)]

var elPresidenteTags  = Tags(flavors: [.orange, .pomegranate],
                             profiles: [.aromatic, .fruity],
                             textures: [.rich],
                             styles: [.martini, .stirred],
                             bases: [.whiteRum, .blancVermouth])
