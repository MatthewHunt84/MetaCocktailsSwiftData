//
//  Cosmopolitan.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/10/23.
//

import SwiftUI


var cosmopolitan  = Cocktail(name: "Cosmopolitan",
                             imageName: Image(.emptyCocktail),
                             background: Color.brandPrimaryOrange,
                             glasswareType: .martini,
                             garnish: [GarnishCatalog.orangePeel.asset],
                             ice: nil,
                             author: "Cheryl Cook (Not Actually Dale DeGroff, but we still love Dale!)",
                             spec: cosmoSpec,
                             buildOrder: nil,
                             tags: cosmoTags)

var cosmoSpec  = [CocktailIngredient(name: .citrusVodka, value: 1.5, unit: .fluidOunces), CocktailIngredient(name: .cointreau, value: 0.75, unit: .fluidOunces), CocktailIngredient(name: .cranberryJuice, value: 1, unit: .fluidOunces), CocktailIngredient(name: .lime, value: 0.25, unit: .fluidOunces)]



var cosmoTags  = Tags(flavors: [.orange, .cranberry, .lime, .lemon ], textures: [.light], styles: [.sour, .shaken], baseComponents: [.citrusVodka])
