////
////  TrinidadSour.swift
////  MetaCocktailsSwiftData
////
////  Created by James on 9/26/23.
////

import SwiftUI


var trinidadSour = Cocktail(cocktailName: "Trinidad Sour",
                            glasswareType: .coupe,
                            garnish: [.noGarnish],
                            author: ["Giuseppe Gonzalas"],
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [CocktailIngredient(.juices(.lemon), value: 0.75),
                        CocktailIngredient(.syrups(.orgeat), value: 1),
                        CocktailIngredient(.whiskies(.ryeWhiskey), value: 0.5),
                        CocktailIngredient(.bitters(.angosturaBitters), value: 1.5)]
                        
var trinidadSourTags = Tags(flavors: [.almond, .lemon, .bakingSpices],
                            profiles: [.aromatic, .bitter],
                            textures: [.silky],
                            styles: [.sour, .shaken])
