//
//  HelperMethods.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/6/24.
//

import SwiftUI

func pluralizedIngredientText(for ingredient: Ingredient) -> Text {
    if ingredient.unit.canBePluralized{
        Text("^[\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)](inflect: true) \(ingredient.ingredientBase.name)")
    } else {
        Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredientBase.name)")
    }
}

func pluralizedIngredientUnitText(for ingredient: Ingredient) -> Text {
    if ingredient.unit.canBePluralized{
        Text("^[\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)](inflect: true)")
    } else {
        Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)")
    }
}
