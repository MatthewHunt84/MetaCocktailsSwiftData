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
    @State private var isShowingBottleMathModal: Bool = false
    @FocusState.Binding var isFocused: Bool
    
    
    var body: some View {
        
        HStack {
            
            Text(quantifiedBatchedIngredient.ingredientName)
                .font(FontFactory.formLabel18)
                .foregroundStyle(.primary)
            
            Spacer()
            
            if viewModel.editingIngredient == quantifiedBatchedIngredient.ingredientName {
                
                TextField("\(quantifiedBatchedIngredient.totalMls)", text: $quantifiedBatchedIngredient.editedTotalMls)
                    .font(FontFactory.formLabel18)
                    .tint(ColorScheme.interactionTint)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .background(.clear)
                    .focused($isFocused)
            } else {
                
                
                Text("\(quantifiedBatchedIngredient.totalMls) ml")
                    .font(FontFactory.mediumFont(size: 18))
                    .foregroundStyle(ColorScheme.interactionTint)
                    .background(.clear)
                    .onTapGesture {
                        quantifiedBatchedIngredient.editedTotalMls = String(quantifiedBatchedIngredient.totalMls)
                        viewModel.updateEditingIngredient(name: quantifiedBatchedIngredient.ingredientName)
                        isFocused = true
                        quantifiedBatchedIngredient.editedTotalMls = ""
                    }
            }
        }
        .swipeActions(edge: .trailing) {
            Button(role: .none) {
                isShowingBottleMathModal.toggle()
            } label: {
                Label("By bottle number", systemImage: "basket")
            }
            .tint(ColorScheme.interactionTint)
        }
        .sheet(isPresented: $isShowingBottleMathModal) {
            BottleMathModalView(
                quantifiedBatchedIngredient: $quantifiedBatchedIngredient,
                isShowingBottleMathModal: $isShowingBottleMathModal
            )
        }
    }
}
