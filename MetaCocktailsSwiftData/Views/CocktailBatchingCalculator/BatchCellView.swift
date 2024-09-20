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
//        VStack(alignment: .leading) {
            HStack {
                
                Text(quantifiedBatchedIngredient.ingredientName)
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(.white)
                
                Spacer()
                
                if viewModel.editingIngredient == quantifiedBatchedIngredient.ingredientName {
                    
                    TextField("\(quantifiedBatchedIngredient.totalMls)", text: $quantifiedBatchedIngredient.editedTotalMls)
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
//                        .padding(.vertical, 5)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(12)
                        .focused($isFocused)
                    
//                    BottleMathButton(isShowingBottleMathModal: $isShowingBottleMathModal)
//                    Text("ml")
//                        .font(FontFactory.formLabel18)
//                        .multilineTextAlignment(.leading)
                } else {
                    
                    Text("\(quantifiedBatchedIngredient.totalMls)")
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
//                        .padding(.vertical, 5)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(12)
                        .onTapGesture {
                            quantifiedBatchedIngredient.editedTotalMls = String(quantifiedBatchedIngredient.totalMls)
                            viewModel.updateEditingIngredient(name: quantifiedBatchedIngredient.ingredientName)
                            isFocused = true
                            quantifiedBatchedIngredient.editedTotalMls = ""
                        }
                    
                    
//                    Text("ml")
//                        .font(FontFactory.formLabel18)
//                        .multilineTextAlignment(.leading)
                }

//                BottleMathButton(isShowingBottleMathModal: $isShowingBottleMathModal)

            }
            .swipeActions(edge: .trailing) {
                Button(role: .none) {
                    isShowingBottleMathModal.toggle()
                } label: {
                    Label("By bottle number", systemImage: "basket")
                }
                .tint(ColorScheme.interactionTint)
            }
//            .offset(x: 0, y: 5)
//        }
//        .padding(.vertical, 10)
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
            Image(systemName: "0.circle")
                .foregroundStyle(ColorScheme.interactionTint)
                .frame(alignment: .trailing)
//            Image("BlueTintBottle")
//                .resizable()
//                .frame(width: 30, height: 20, alignment: .center)
        }
    }
}
