//
//  SideCar.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 1/21/24.
//

import Foundation


var sidecar = Cocktail(cocktailName: "Sidecar",
                        glasswareType: .sugarRimStemmed,
                        ice: nil,
                        spec: sidecarSpec,
                        buildOrder: nil,
                        tags: sidecarTags)

var sidecarSpec  = [CocktailIngredient(.juices(.lemon), value: 0.5),
                     CocktailIngredient(.liqueurs(.cointreau), value: 0.75),
                    CocktailIngredient(.brandies(.cognacVSOP), value: 1.5)]

var sidecarTags = Tags(profiles: [.citrusy, .fruity],
                       textures: [.light],
                        styles: [.sour, .shaken])
                    
