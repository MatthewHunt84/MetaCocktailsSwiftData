////
////  UltimaPalabra.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 10/20/23.
////

import SwiftUI

var ultimaPalabra = Cocktail(cocktailName: "Ultima Palabra",
                             glasswareType: .stemmedGlassware,
                             ice: nil,
                             spec: ultimaPalabraSpec,
                             tags: ultimaPalabraTags,
                             variation: .ultimaPalabra,
                             titleCocktail: true)

var ultimaPalabraSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                          CocktailIngredient(.agaves(.mezcalSmokeyAny), value: 0.75),
                          CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                          CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var ultimaPalabraTags = Tags(profiles: [.punchy, .herbal, .citrusy],
                             styles: [.daisy, .shaken, .sour])

