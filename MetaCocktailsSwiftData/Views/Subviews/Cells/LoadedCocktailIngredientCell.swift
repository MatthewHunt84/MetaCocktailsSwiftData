//
//  LoadedCocktailIngredientCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI


struct LoadedCocktailIngredientCell: View {
    
    @Binding var ingredient: CBCLoadedIngredient
    
    
    
    var body: some View {
        HStack {
            
            Text("\(ingredient.ingredient.ingredientBase.name)")
                
            
            Spacer()
            
            Toggle(isOn: $ingredient.isIncluded) {}
                .tint(ColorScheme.selectedColor)
                .frame(maxWidth: 60)
            
            
        }
     
    }
}

#Preview {
    LoadedCocktailIngredientCell(ingredient: .constant(CBCLoadedIngredient(ingredient: Ingredient(ingredientBase: IngredientBase(name: "Lemon Juice", category: .juices, prep: nil), value: 0.75, unit: .fluidOunces), isIncluded: true)))
}
