//
//  HelperMethods.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/6/24.
//

import SwiftUI



func pluralizedIngredientUnitText(for ingredient: Ingredient) -> Text {
    if ingredient.unit.canBePluralized{
        Text("^[\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)](inflect: true) \(ingredient.ingredientBase.name)")
    } else {
        Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredientBase.name)")
    }
}

func pluralizedIngredientText(for ingredient: Ingredient, displayMls: Bool) -> Text {
   
    if displayMls {
        if ingredient.unit == .fluidOunces {
            return Text("\(NSNumber(value: Int(ingredient.value.toMilliliters.rounded()))) \(MeasurementUnit.ml.rawValue)")
        } else if ingredient.unit == .ml {
            return Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)")
        }
    } else {
        if ingredient.unit == .ml {
            let roundedOunces = (ingredient.value.toOunces * 100).rounded() / 100
            return Text("\(NSNumber(value: roundedOunces)) \(MeasurementUnit.fluidOunces.rawValue)")
        } else if ingredient.unit == .fluidOunces && ingredient.unit.canBePluralized {
            return Text("^[\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)](inflect: true)")
        } else if ingredient.unit == .fluidOunces {
            return Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)")
        }
    }
    
    if ingredient.unit.canBePluralized {
        return Text("^[\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)](inflect: true)")
    } else {
        return Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue)")
    }
}
