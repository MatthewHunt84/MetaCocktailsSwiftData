//
//  BatchCellDryIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 4/28/25.
//

import SwiftUI

struct BatchCellDryIngredientView: View {
    
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedDryBatchedIngredient: DryBatchedCellData
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text(quantifiedDryBatchedIngredient.dryIngredientName)
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(.primary)
                
                Spacer()
                Text("\(Int(quantifiedDryBatchedIngredient.dryIngredientAmount)) \(quantifiedDryBatchedIngredient.unitName)")
                    .font(FontFactory.formLabel18)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .background(.clear)
            }
        }
    }
}

#Preview {
    @Previewable @State var quantifiedDryBatchedIngredient: DryBatchedCellData = DryBatchedCellData(dryIngredientName: "Test", dryIngredientAmount: 2.0, unitName: MeasurementUnit.grams.rawValue)
    
    BatchCellDryIngredientView(quantifiedDryBatchedIngredient: $quantifiedDryBatchedIngredient)
}
