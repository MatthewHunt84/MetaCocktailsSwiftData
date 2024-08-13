//
//  BatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/6/24.
//

import SwiftUI

struct BottleBatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State var bottleSize: BottleSize = .oneLiter
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @FocusState private var isFocused: Bool
   
  
    
    
    var body: some View {
        HStack{
            Text(quantifiedBatchedIngredient.ingredientName)
            Spacer()
            Picker("Bottle Size", selection: $bottleSize) {
                ForEach(BottleSize.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 100, height: 50)
            if bottleSize == .oneLiter {
                TextField("Btl#", value: $quantifiedBatchedIngredient.whole1LBottles, formatter: viewModel.formatter).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .focused($isFocused)
                    .onChange(of: isFocused, { _, _ in
                        if bottleSize == .oneLiter {
                            viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles)
                            viewModel.convertIngredientsToBatchCellData()
                        } else {
                            viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles)
                            viewModel.convertIngredientsToBatchCellData()
                        }
                    })
                    .keyboardType(.decimalPad)
                
                
                
                Text("\(quantifiedBatchedIngredient.remaining1LMls)ml")
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
            } else {
                TextField("Btl#", value: $quantifiedBatchedIngredient.whole750mlBottles, formatter: viewModel.formatter).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .focused($isFocused)
                    .onChange(of: isFocused, { _, _ in
                        if bottleSize == .oneLiter {
                            viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles)
                            viewModel.convertIngredientsToBatchCellData()
                        } else {
                            viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles)
                            viewModel.convertIngredientsToBatchCellData()
                        }
                    })
                    .keyboardType(.decimalPad)
                Text("\(quantifiedBatchedIngredient.remaining750mLs)ml")
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
            
            
        }
        .frame(maxHeight: 50)     
    }
}

#Preview {
    BottleBatchCell(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
        .environmentObject(CBCViewModel())
}
enum BottleSize: String, CaseIterable {
    case oneLiter = "1L"
    case seven50ml = "750ml"
    
}
