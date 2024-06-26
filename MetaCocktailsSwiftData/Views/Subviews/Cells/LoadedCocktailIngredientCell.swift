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
            if ingredient.ingredient.name == nil {
                Text("\(ingredient.ingredient.ingredient.name)")
            } else {
                if let name = ingredient.ingredient.name {
                    Text("\(name)")
                }
            }
            
            
                
            
            Spacer()
            
            Toggle(isOn: $ingredient.isIncluded) {}
                .tint(.brandPrimaryGreen)
                .frame(maxWidth: 60)
            
            
        }
     
    }
}

#Preview {
    LoadedCocktailIngredientCell(ingredient: .constant(CBCLoadedIngredient(ingredient: CocktailIngredient(.agaves(.elTesoroRepo), value: 2.0), isIncluded: true)))
}
