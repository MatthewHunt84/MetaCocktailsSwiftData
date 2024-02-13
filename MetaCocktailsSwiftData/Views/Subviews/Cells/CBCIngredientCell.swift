//
//  CBCIngredientCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI


struct CBCIngredientCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    var ingredient: BatchIngredient
    @State var amountInMls =  0
    
    
    
    var body: some View {
        HStack {
            //            TextField("Vol.", value:  $amountInMls, formatter: viewModel.formatter).cBCTextField()
            //                .frame(width: 70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //                .onSubmit {
            //                    ingredient.amount = Double(amountInMls)
            //
            //                    viewModel.calculateABV()
            //                }
            //            Text("ml (\(NSNumber(value: ingredient.amount))oz) \(ingredient.name) ")
            Text("\(amountInMls)ml (\(NSNumber(value: ingredient.amount))oz) \(ingredient.name)")
                .frame(width: 200, height: 50, alignment: .leading)
              
            Spacer()
            //            TextField("ABV", value: $ingredient.aBV, formatter: viewModel.formatter).cBCTextField()
            //                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //                .onSubmit {
            //                    viewModel.calculateABV()
            //                }
            //            Text(" %ABV")
            Text("\(NSNumber(value: ingredient.aBV)) %ABV")
                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            
        }

        .frame(maxHeight: 50)
        
        
    }
}
//
#Preview {
    
    
   
    CBCIngredientCell(ingredient: BatchIngredient(name: "Balls", amount: 0.0, aBV: 0.0))
        .environmentObject(CBCViewModel())
                
      
}

