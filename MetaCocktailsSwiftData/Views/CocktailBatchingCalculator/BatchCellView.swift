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
    @FocusState var isFocused: Bool
    @FocusState var bottleBatchInputActive: Bool
    @Binding var isShowingOunceMeasurements: Bool
    @Binding var isShowingBottleMathAmounts: Bool
    @State private var isShowingBottleMathModal: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(quantifiedBatchedIngredient.ingredientName)
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(.primary)
                
                Spacer()
                editableMlView(quantifiedBatchedIngredient: $quantifiedBatchedIngredient, isFocused: _isFocused)
                
            }
            
            if isShowingOunceMeasurements {
                
                if viewModel.findIngredientOunceAmountFor(batchCellData: quantifiedBatchedIngredient).truncatingRemainder(dividingBy: 1) == 0 {
                    Text("\(Int(viewModel.findIngredientOunceAmountFor(batchCellData: quantifiedBatchedIngredient))) oz")
                        .font(FontFactory.formLabel18)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    Text("\(viewModel.findIngredientOunceAmountFor(batchCellData: quantifiedBatchedIngredient), specifier: "%.2f") oz")
                        .font(FontFactory.formLabel18)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            if isShowingBottleMathAmounts {
                HStack(spacing: 0) {
                    Text("\(quantifiedBatchedIngredient.wholeBottles) x \(quantifiedBatchedIngredient.bottleSize)ml bottles ")
                        .font(FontFactory.fontBody16)
                        .foregroundStyle(.secondary)
                    if quantifiedBatchedIngredient.remainingMls > 0 {
                        Text("+ \(quantifiedBatchedIngredient.remainingMls)ml")
                            .font(FontFactory.fontBody16)
                            .foregroundStyle(.secondary)
                    }
                        
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .swipeActions(edge: .trailing) {
            Button(role: .none) {
                viewModel.editingBottleMathIngredient = quantifiedBatchedIngredient
                isShowingBottleMathModal = true
            } label: {
                Label("By bottle number", systemImage: "basket")
            }
            .tint(ColorScheme.interactionTint)
        }
        .sheet(isPresented: $isShowingBottleMathModal) {
            BottleMathModalView(quantifiedBatchedIngredient: $viewModel.quantifiedBatchedIngredients[viewModel.findIndexForBottleMath()],
                                isShowingBottleMathModal: $isShowingBottleMathModal,
                                keyboardFocused: _isFocused)
        }
    }
}

struct editableMlView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @FocusState  var isFocused: Bool
    var body: some View {
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
}
