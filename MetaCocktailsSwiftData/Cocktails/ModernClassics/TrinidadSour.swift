//
//  TrinidadSour.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 9/26/23.
//

import SwiftUI


var trinidadSour = Cocktail(name: "Trinidad Sour",
                            imageName: Image(.emptyCocktail),
                            background: Color.brandPrimaryBlue,
                            glasswareType: .coupe,
                            garnish: [GarnishCatalog.noGarnish.asset],
                            author: "Giuseppe Gonzalas",
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [CocktailIngredient(name: .ryeWhiskey, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient(name: .lemon, value: 0.75, unit: .fluidOunces),
                        CocktailIngredient(name: .orgeat, value: 1, unit: .fluidOunces),
                        CocktailIngredient(name: .angosturaBitters, value: 1.5, unit: .fluidOunces)]


var trinidadSourTags = Tags(flavors: [.almond, .bakingSpices, .lemon, .whiskey],
                            textures: [.velvety],
                            styles: [.sour, .shaken],
                            baseComponents: [.ryeWhiskey])
