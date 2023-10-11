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
                            glasswareType: Glassware.coupe,
                            garnish: [GarnishCatalog.noGarnish.asset],
                            author: "Giuseppe Gonzalas",
                            spec: trinidadSourSpec,
                            buildOrder: nil,
                            tags: trinidadSourTags)

var trinidadSourSpec = [CocktailIngredient(name: Ingredient.ryeWhiskey, value: 0.5, unit: .fluidOunces),
                        CocktailIngredient(name: Ingredient.lemon, value: 0.75, unit: .fluidOunces),
                        CocktailIngredient(name: Ingredient.orgeat, value: 1, unit: .fluidOunces),
                        CocktailIngredient(name: Ingredient.angosturaBitters, value: 1.5, unit: .fluidOunces)]


var trinidadSourTags = Tags(flavors: [Flavor.almond, Flavor.bakingSpices, Flavor.lemon, Flavor.whiskey],
                            textures: [Texture.velvety],
                            styles: [Style.sour],
                            baseComponents: [.ryeWhiskey])
