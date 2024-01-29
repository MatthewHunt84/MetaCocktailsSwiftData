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
                        tags: ultimaPalabraTags)

var ultimaPalabraSpec  = [CocktailIngredient(.juices(.lime), value: 0.75),
                          CocktailIngredient(.agaves(.mezcalSmokey), value: 0.75),
                          CocktailIngredient(.liqueurs(.maraschinoLiqueur), value: 0.75),
                          CocktailIngredient(.liqueurs(.greenChartreuse), value: 0.75)]

var ultimaPalabraTags = Tags(textures: [.light],
                             styles: [.sour, .shaken],
                             booze: [Booze(.agaves(.mezcalAny))])
                            
