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
        VStack(alignment: .leading) {
            HStack {
                Text(quantifiedBatchedIngredient.ingredientName)
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(.white)
                Spacer()
                if viewModel.editingIngredient == quantifiedBatchedIngredient.ingredientName {
                    BottleMathButton(isShowingBottleMathModal: $isShowingBottleMathModal)
                    TextField("\(quantifiedBatchedIngredient.totalMls)", text: $quantifiedBatchedIngredient.editedTotalMls)
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .focused($isFocused)
                    Text("ml")
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.leading)
                } else {
                    BottleMathButton(isShowingBottleMathModal: $isShowingBottleMathModal)
                    Text("\(quantifiedBatchedIngredient.totalMls)")
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                        .onTapGesture {
                            quantifiedBatchedIngredient.editedTotalMls = String(quantifiedBatchedIngredient.totalMls)
                            viewModel.updateEditingIngredient(name: quantifiedBatchedIngredient.ingredientName)
                            isFocused = true
                            quantifiedBatchedIngredient.editedTotalMls = ""
                        }
                    Text("ml")
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.leading)
                }
            }
            .offset(x: 0, y: 5)
        }
        .padding(.vertical, 10)
        .sheet(isPresented: $isShowingBottleMathModal) {
            BottleMathModalView(
                quantifiedBatchedIngredient: $quantifiedBatchedIngredient,
                isShowingBottleMathModal: $isShowingBottleMathModal
            )
        }
    }
}

struct BottleMathButton: View {
    @Binding var isShowingBottleMathModal: Bool
    
    var body: some View {
        Button {
            isShowingBottleMathModal.toggle()
        } label: {
            Image("BlueTintBottle")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
        }
    }
}
