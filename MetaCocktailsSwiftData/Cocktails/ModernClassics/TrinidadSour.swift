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

var trinidadSourSpec = [CocktailIngredient( .lemon, value: 0.75, unit: .fluidOunces),
                        CocktailIngredient( .orgeat, value: 1, unit: .fluidOunces),
                        CocktailIngredient( .ryeWhiskey, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient( .angosturaBitters, value: 1.5, unit: .fluidOunces)]
                        


var trinidadSourTags = Tags(flavors: [.almond, .lemon, .whiskey],
                            profiles: [.aromatic, .bitter, .bakingSpices],
                            textures: [.velvety],
                            styles: [.sour, .shaken],
                            bases: [.ryeWhiskey])
