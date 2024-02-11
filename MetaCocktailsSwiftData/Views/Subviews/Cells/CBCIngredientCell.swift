//
//  CBCIngredientCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI


struct CBCIngredientCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Bindable var ingredient: BatchIngredient
    @State var amountInMls =  0
    
    
    var body: some View {
        HStack {
            TextField("Vol.", value:  $amountInMls, formatter: viewModel.formatter).cBCTextField()
                .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    ingredient.amount = Double(amountInMls)
                    viewModel.calculateABV()
                }
            Text("ml \(ingredient.name)")
            Spacer()
            TextField("ABV", value: $ingredient.aBV, formatter: viewModel.formatter).cBCTextField()
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
    
    
   
    CBCIngredientCell(ingredient: BatchIngredient(name: "Balls", amount: 0.0, aBV: 0.0))
                
      
}

