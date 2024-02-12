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
        .padding()
    }
}

#Preview {
    SplitBatchCell(quantifiedSpiltBatches: .constant(SplitBatchCellData(ingredientName: "Jungus", splitIngredientAmount: 69)))
        .environmentObject(CBCViewModel())
}
