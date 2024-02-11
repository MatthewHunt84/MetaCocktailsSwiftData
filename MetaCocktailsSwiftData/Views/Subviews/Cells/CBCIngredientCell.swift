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
    @State var amountInMls =  ""
    
    
    var body: some View {
        HStack {
            TextField("Vol.", text:  $amountInMls).cBCTextField()
                .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onSubmit {
                    viewModel.calculateABV()
                }
            Text("ml \(ingredient.name)")
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
    
    
   
    CBCIngredientCell(ingredient: BatchIngredient(name: "Balls", amount: "34", aBV: "35"))
                
      
}

