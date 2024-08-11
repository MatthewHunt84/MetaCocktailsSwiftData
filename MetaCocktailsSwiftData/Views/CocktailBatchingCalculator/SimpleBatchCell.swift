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
    @State private var showBottleMath: Bool = false
    @State private var cellSize: Double = 40
    var body: some View {
        VStack{
            HStack{
                Text(quantifiedBatchedIngredient.ingredientName)
                Spacer()
                Text("\(quantifiedBatchedIngredient.totalMls)ml")
                
                
            }
            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        showBottleMath.toggle()
                    }
                }) {
                    Text("Show bottle math")
                       
                }
                .buttonStyle(.borderless)
                .font(.caption)
                .foregroundStyle(.brandPrimaryGold)
                
                
            }
            if showBottleMath {
              
                HStack {
                   
                    Spacer()
                    HStack {
                        Text("\(Int(quantifiedBatchedIngredient.whole1LBottles)) x 1L Bottles")
                        if quantifiedBatchedIngredient.remaining1LMls != 0 {
                            Text("+")
                            Text("\(quantifiedBatchedIngredient.remaining1LMls)ml")
                        }
                    }
                    .font(.footnote).bold()
                    Button {
                        
                        viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles + 1)
                        
                        
                    } label: {
                        Image(systemName: "arrow.up.circle")
                        
                    }
                    .buttonStyle(.bordered)
                    Button {
                        if quantifiedBatchedIngredient.whole1LBottles != 0 {
                            viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles - 1)
                        }
                        
                    } label: {
                        Image(systemName: "arrow.down.circle")
                        
                    }
                    .buttonStyle(.bordered)
                   
                    
                }
                .foregroundStyle(.brandPrimaryGold)
                .transition(.slide)
                HStack {
                    Spacer()
                    HStack {
                        Text("\(Int(quantifiedBatchedIngredient.whole750mlBottles)) x 750ml Bottles")
                        
                        if quantifiedBatchedIngredient.remaining750mLs != 0 {
                            Text("+")
                            Text("\(quantifiedBatchedIngredient.remaining750mLs)ml")
                        }
                        
                    }
                    .font(.footnote).bold()
                    
                    Button {
                        
                        viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles + 1)
                        
                        
                    } label: {
                        
                        Image(systemName: "arrow.up.circle")
                        
                        
                    }
                    .buttonStyle(.bordered)
                    Button {
                        if quantifiedBatchedIngredient.whole750mlBottles != 0 {
                            viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles - 1)
                            
                        }
                    } label: {
                        
                        Image(systemName: "arrow.down.circle")
                        
                        
                    }
                    .buttonStyle(.bordered)
                    
                }
                .foregroundStyle(.brandPrimaryGreen)
                .transition(.slide)
            }
               
                
            
        }
        
    }
    
}


#Preview {
    SimpleBatchCell(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
        .environmentObject(CBCViewModel())
}
