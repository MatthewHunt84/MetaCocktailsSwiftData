//
//  CBCIngredientCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI


struct CBCIngredientCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var ingredient: BatchIngredient
  
    
    var body: some View {
        HStack {
            TextField("Vol.", text: $ingredient.amount).cBCTextField()
                .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    viewModel.calculateABV()
                }
            Text("oz. \(ingredient.name)")
            Spacer()
            TextField("ABV", text: $ingredient.aBV).cBCTextField()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    viewModel.calculateABV()
                }
            Text(" %ABV")
            
        }

        .frame(maxHeight: 50)
        
        
    }
}
//
#Preview {
    
    
   
    CBCIngredientCell(ingredient: .constant(BatchIngredient(name: "Super Long Ingredient", amount: "45", aBV: "20")))
                
      
}

