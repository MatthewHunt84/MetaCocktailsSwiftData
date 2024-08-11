//
//  SimpleBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/30/24.
//

import SwiftUI

struct SimpleBatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    
    var body: some View {
        VStack{
            HStack{
                Text(quantifiedBatchedIngredient.ingredientName)
                Spacer()
                Text("\(quantifiedBatchedIngredient.totalMls)ml")
                
                
            }.frame(maxHeight: 40)
            HStack {
                Spacer()
                HStack {
                    Text("\(Int(quantifiedBatchedIngredient.whole1LBottles)) x 1L Bottles")
                    if quantifiedBatchedIngredient.remaining1LMls != 0 {
                        Text("+ \(quantifiedBatchedIngredient.remaining1LMls)ml")
                    }
                }
                .font(.footnote)
                Button {
                    
                    viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles + 1)
                 
                    
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .font(.footnote)
                }
                .buttonStyle(.bordered)
                Button {
                    if quantifiedBatchedIngredient.whole1LBottles != 0 {
                        viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles - 1)
                    }
                    
                } label: {
                    Image(systemName: "arrow.down.circle")
                        .font(.footnote)
                }
                .buttonStyle(.bordered)
                
            }
            HStack {
                Spacer()
                HStack {
                    Text("\(Int(quantifiedBatchedIngredient.whole750mlBottles)) x 750ml Bottles")
                   
                    if quantifiedBatchedIngredient.remaining750mLs != 0 {
                        Text("+ \(quantifiedBatchedIngredient.remaining750mLs)ml")
                    }
                    
                }
                .font(.footnote)
                Button {
                    
                    viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles + 1)
                    
                    
                } label: {
                    
                    Image(systemName: "arrow.up.circle")
                        .font(.footnote)
                    
                }
                .buttonStyle(.bordered)
                Button {
                    if quantifiedBatchedIngredient.whole750mlBottles != 0 {
                        viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles - 1)
                        
                    }
                } label: {
                    
                    Image(systemName: "arrow.down.circle")
                        .font(.footnote)
                    
                }
                .buttonStyle(.bordered)
              
            }
            
        }
        
    }
    
}


#Preview {
    SimpleBatchCell(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
        .environmentObject(CBCViewModel())
}
