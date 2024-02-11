//
//  BatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/6/24.
//

import SwiftUI

struct BatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @State var bottleSize: BottleSize = .oneLiter
    @Binding var quantifiedBatchedIngredient: BatchedCellData
    
    
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
                    .onSubmit {
                        viewModel.doMathForModified1LBottleCount(initialAmount: quantifiedBatchedIngredient.mlAmount, newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles)
                    }
                Text("\(quantifiedBatchedIngredient.remaining1LMls)ml")
                    .frame(width: 80, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
            } else {
                TextField("Btl#", text: $quantifiedBatchedIngredient.whole750mlBottles).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onSubmit {
                        viewModel.convertIngredientsToBatchCellData()
                    }
                TextField("/mls.", text: $quantifiedBatchedIngredient.remaining750mLs).cBCTextField()
                    .autocorrectionDisabled()
                    .frame(width: 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onSubmit {
                        viewModel.convertIngredientsToBatchCellData()
                    }
            }
            
            
        }
        .frame(maxHeight: 50)
        
    }
}
//
//#Preview {
//    BatchCell(quantifiedBatchedIngredient: .constant(BatchedCellData(ingredientName: "", whole1LBottles: "", remaining1LMls: "", mlAmount: "")))
//        .environmentObject(CBCViewModel())
//}
enum BottleSize: String, CaseIterable {
    case oneLiter = "1L"
    case seven50ml = "750ml"
    
}
