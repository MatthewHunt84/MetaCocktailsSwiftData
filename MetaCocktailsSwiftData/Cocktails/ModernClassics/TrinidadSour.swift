//
//  TrinidadSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/26/23.
//

import SwiftUI


var trinidadSour = Cocktail(cocktailName: "Trinidad Sour",
                            glasswareType: .coupe,
                            garnish: [.noGarnish],
                            author: "Giuseppe Gonzalas",
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [CocktailIngredient( .lemon, value: 0.75),
                        CocktailIngredient( .orgeat, value: 1),
                        CocktailIngredient( .ryeWhiskey, value: 0.5),
                        CocktailIngredient( .angosturaBitters, value: 1.5)]
                        


var trinidadSourTags = Tags(flavors: [.almond, .lemon],
                            profiles: [.aromatic, .bitter, .bakingSpices],
                            textures: [.silky],
                            styles: [.sour, .shaken],
                            bases: [.ryeWhiskey, .angosturaBitters])
