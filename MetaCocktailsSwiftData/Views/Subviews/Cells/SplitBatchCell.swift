//
//  SplitBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/11/24.
//

import SwiftUI

struct SplitBatchCell: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BatchedCellData
    var body: some View {
        HStack {
            Spacer()
            Text("\(quantifiedBatchedIngredient.ingredientName)")
            Text("\(quantifiedBatchedIngredient.remaining1LMls)ml")
        }
        .padding()
    }
}

#Preview {
    SplitBatchCell(quantifiedBatchedIngredient: .constant(BatchedCellData(ingredientName: "Johnson Town", whole1LBottles: 2.5, remaining1LMls: 56, whole750mlBottles: 3.6, remaining750mLs: 500, mlAmount: 45)))
        .environmentObject(CBCViewModel())
}
