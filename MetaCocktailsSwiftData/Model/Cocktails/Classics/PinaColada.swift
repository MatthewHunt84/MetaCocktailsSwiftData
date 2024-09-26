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

var pinaColadaNotes = "The widely recognized version of the Piña Colada today is a blended frozen cocktail that originated with the creation of Coco Lopez in Puerto Rico. It is regarded as their signature drink. The term 'Piña Colada' translates to 'strained pineapple.' According to Dave Wondrich, prior to Coco Lopez, the Piña Colada was a Cuban non-alcoholic refreshment. It's likely that Cubans also mixed rum into it, representing one of those seemingly inevitable combinations that obscure its true origin. To prepare this version, you'll need approximately 250ml of crushed ice to blend with the other ingredients."

