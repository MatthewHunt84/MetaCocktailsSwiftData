//
//  TrinidadSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/26/23.
//

import SwiftUI


var trinidadSour = Cocktail(name: "Trinidad Sour",
                            imageName: "empty-Cocktail",
                            glasswareType: .coupe,
                            garnish: [GarnishCatalog.noGarnish.asset],
                            author: "Giuseppe Gonzalas",
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [CocktailIngredient(name: .lemon, value: 0.75, unit: .fluidOunces),
                        CocktailIngredient(name: .orgeat, value: 1, unit: .fluidOunces),
                        CocktailIngredient(name: .ryeWhiskey, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient(name: .angosturaBitters, value: 1.5, unit: .fluidOunces)]
                        


var trinidadSourTags = Tags(flavors: [.almond, .lemon, .whiskey],
                            profiles: [.aromatic, .bitter, .bakingSpices],
                            textures: [.velvety],
                            styles: [.sour, .shaken],
                            baseComponents: [.ryeWhiskey])
