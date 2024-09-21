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
            Text("\(quantifiedSpiltBatches.splitIngredientAmount) ml")
                .font(FontFactory.formLabel18)
            Text("\(quantifiedSpiltBatches.ingredientName)")
                .font(FontFactory.formLabel18)
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10))
    }
}

#Preview {
    SplitBatchCell(quantifiedSpiltBatches: .constant(SplitBatchCellData(ingredientName: "Test", splitIngredientAmount: 69)))
        .environmentObject(CBCViewModel())
}
