//
//  Negroni.swift
//  MetaCocktailsSwiftData
//
//  Created by James on 10/6/23.
//

import SwiftUI

var negroni  =  Cocktail(name: "Negroni",
                         imageName: Image(.emptyCocktail),
                         background: Color.brandPrimaryRed,
                         glasswareType: Glassware.doubleOld,
                         garnish: [GarnishCatalog.orangePeel.asset], 
                         ice: Ingredient.bigRock,
                         author: "Count Camillo Negroni",
                         spec: negroniSpec,
                         buildOrder: nil,
                         tags: negroniTags)

var negroniSpec = [CocktailIngredient(name: Ingredient.gin, value: 1, unit: .fluidOunces), CocktailIngredient(name: Ingredient.sweetVermouth, value: 1, unit: .fluidOunces), CocktailIngredient(name: Ingredient.campari, value: 1, unit: .fluidOunces)]

var negroniTags = Tags(flavors: [.orange, .bitter, .bakingSpices], textures: [.rich], styles: [.negroni, .stirred], baseComponents: [.gin])
