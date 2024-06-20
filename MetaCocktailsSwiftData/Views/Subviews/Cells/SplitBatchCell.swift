//
//  SplitBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct SplitBatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedSpiltBatches: SplitBatchCellData
    var body: some View {
        HStack {
            Spacer()
            Text("\(quantifiedSpiltBatches.ingredientName)")
            Text("\(quantifiedSpiltBatches.splitIngredientAmount)ml")
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
    }
}

#Preview {
    SplitBatchCell(quantifiedSpiltBatches: .constant(SplitBatchCellData(ingredientName: "Test", splitIngredientAmount: 69)))
        .environmentObject(CBCViewModel())
}
