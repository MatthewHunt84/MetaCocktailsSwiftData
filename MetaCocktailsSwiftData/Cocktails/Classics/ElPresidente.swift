//
//  ElPresidente.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI


var elPresidente  = Cocktail(name: "El Presidente",
                             imageName: Image(.emptyCocktail),
                             background: Color(.brandPrimaryPurple),
                             glasswareType: .coupe,
                             garnish: [GarnishCatalog.orangePeel.asset, GarnishCatalog.maraschinoCherry.asset],
                             ice: nil,
                             author: "Constante Ribalaiuga",
                             spec: elPresidenteSpec,
                             buildOrder: nil,
                             tags: elPresidenteTags)

var elPresidenteSpec  = [CocktailIngredient(name: .whiteRum, value: 1.5, unit: .fluidOunces), CocktailIngredient(name: .blancVermouth, value: 1.5, unit: .fluidOunces), CocktailIngredient(name: .orangeCuracao , value: 1, unit: .barspoon), CocktailIngredient(name: .granadine, value: 0.5, unit: .barspoon)]

var elPresidenteTags  = Tags(flavors: [.orange, .pomegranate], textures: [.rich], styles: [.martini, .stirred], baseComponents: [.whiteRum, .blancVermouth])
