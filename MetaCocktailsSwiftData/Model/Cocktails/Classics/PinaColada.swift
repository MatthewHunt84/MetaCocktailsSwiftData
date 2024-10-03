//
//  PinaColada.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/15/24.
//

import Foundation

var pinaColada  = Cocktail(cocktailName: "Piña Colada",
                           glasswareType: .hurricaneGlass,
                           garnish: [.maraschinoCherry],
                           ice: .pebbleIce,
                           spec: pinaColadaSpec,
                           notes: pinaColadaNotes,
                           tags: pinaColadaTags,
                           variation: .pinaColada,
                           titleCocktail: true)

var pinaColadaSpec  = [OldCocktailIngredient(.rums(.rumPuertoRican), value: 2),
                       OldCocktailIngredient(.juices(.pineappleJuice), value: 4),
                       OldCocktailIngredient(.syrups(.cocoLopez), value: 1)]


var pinaColadaTags   = Tags(profiles: [.creamy, .tropical], styles: [.tiki, .blended])

