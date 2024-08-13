//
//  SimpleBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/30/24.
//

import SwiftUI

struct BatchCellView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @State private var showBottleMath: Bool = false

    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(quantifiedBatchedIngredient.ingredientName)
                    .foregroundStyle(.white)
                Spacer()
                Text("\(quantifiedBatchedIngredient.totalMls)ml")
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showBottleMath.toggle()
                }
            }
            HStack {
                Spacer()
                Text("Bottle Math")
                    .font(.caption)
                    .foregroundStyle(.brandPrimaryGold)
                Image(systemName:showBottleMath ? "chevron.up" : "chevron.down")
                    .foregroundStyle(.blue)
                
            }
            .offset(x: 0, y: 5)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showBottleMath.toggle()
                }
            }
            
            if showBottleMath {
                VStack {
                    Divider()
                        .padding(.vertical, 4)
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
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
                    
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
                    .transition(.asymmetric(insertion: .scale, removal: .slide))
                }
                .animation(.easeInOut(duration: 0.5), value: showBottleMath)
            }
        }
        .padding(.vertical, 10)
    }
}


#Preview {
    BatchCellView(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
        .environmentObject(CBCViewModel())
}
