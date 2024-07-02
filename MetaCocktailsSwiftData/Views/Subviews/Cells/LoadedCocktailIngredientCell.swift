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
            
            Text("\(ingredient.ingredient.name)")
                
            
            Spacer()
            
            Toggle(isOn: $ingredient.isIncluded) {}
                .tint(.brandPrimaryGreen)
                .frame(maxWidth: 60)
            
            
        }
     
    }
}

#Preview {
    LoadedCocktailIngredientCell(ingredient: .constant(CBCLoadedIngredient(ingredient: Ingredient("Lemon Juice", ingredientCategory: .juices, value: 0.75), isIncluded: true)))
}
