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
    @State private var showBottleMath: Bool = false
    @Binding var activeEditingIngredient: String?
    @FocusState.Binding var focusedField: String?
    @FocusState.Binding var keyboardFocused: Bool
    
    var isEditing: Bool {
        focusedField == quantifiedBatchedIngredient.ingredientName
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: showBottleMath ? "chevron.down" : "chevron.right")
                    .foregroundStyle(ColorScheme.interactionTint)
                Text(quantifiedBatchedIngredient.ingredientName)
                    .foregroundStyle(.white)
                Spacer()
                TextField("\(quantifiedBatchedIngredient.totalMls)ml", text: $quantifiedBatchedIngredient.editedTotalMls)
                    .autocorrectionDisabled()
                    .padding(5)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    .keyboardType(.decimalPad)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 100)
                    .focused($keyboardFocused)
                    .onTapGesture {
                        activeEditingIngredient = quantifiedBatchedIngredient.ingredientName
                        if quantifiedBatchedIngredient.editedTotalMls.isEmpty {
                            quantifiedBatchedIngredient.editedTotalMls = "\(quantifiedBatchedIngredient.totalMls)"
                        }
                        focusedField = quantifiedBatchedIngredient.ingredientName
                        
                    }
                    .onChange(of: focusedField) { oldValue, newValue in
                        if newValue == quantifiedBatchedIngredient.ingredientName {
                            activeEditingIngredient = quantifiedBatchedIngredient.ingredientName
                        }
                    }
            }
            .onTapGesture {
                keyboardFocused = false
                withAnimation(.easeInOut(duration: 0.5)) {
                    showBottleMath.toggle()
                }
            }
            
            .offset(x: 0, y: 5)
            
            if showBottleMath {
                BottleMathView(quantifiedBatchedIngredient: $quantifiedBatchedIngredient, showBottleMath: $showBottleMath)
            }
        }
        .padding(.vertical, 10)
    }
}

//
//#Preview {
//    BatchCellView(quantifiedBatchedIngredient: .constant(BottleBatchedCellData(ingredientName: "Creme de Cacao", whole1LBottles: 2.1, remaining1LMls: 900, whole750mlBottles: 1.2, remaining750mLs: 34, mlAmount: 55, totalMls: 786)))
//        .environmentObject(CBCViewModel())
//}

struct BottleMathView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @Binding var showBottleMath: Bool
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                
                Spacer()
                HStack {
                    Text("\(Int(quantifiedBatchedIngredient.whole1LBottles)) x 1L Bottles")
                    if quantifiedBatchedIngredient.remaining1LMls != 0 {
                        Text("+")
                        Text("\(quantifiedBatchedIngredient.remaining1LMls)ml")
                    }
                }
                .font(.footnote).bold()
                Button {
                    
                    viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles + 1)
                } label: {
                    Image(systemName: "arrow.up.circle")
                }
                .buttonStyle(.bordered)
                Button {
                    if quantifiedBatchedIngredient.whole1LBottles != 0 {
                        viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles - 1)
                    }
                } label: {
                    Image(systemName: "arrow.down.circle")
                }
                .buttonStyle(.bordered)
            }
            .foregroundStyle(.brandPrimaryGold)
            .transition(.asymmetric(insertion: .scale, removal: .slide))
            
            HStack {
                Spacer()
                HStack {
                    Text("\(Int(quantifiedBatchedIngredient.whole750mlBottles)) x 750ml Bottles")
                    
                    if quantifiedBatchedIngredient.remaining750mLs != 0 {
                        Text("+")
                        Text("\(quantifiedBatchedIngredient.remaining750mLs)ml")
                    }
                }
                .font(.footnote).bold()
                Button {
                    viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles + 1)
                } label: {
                    Image(systemName: "arrow.up.circle")
                }
                .buttonStyle(.bordered)
                Button {
                    if quantifiedBatchedIngredient.whole750mlBottles != 0 {
                        viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles - 1)
                    }
                } label: {
                    Image(systemName: "arrow.down.circle")
                }
                .buttonStyle(.bordered)
            }
            .foregroundStyle(ColorScheme.selectedColor)
            .transition(.asymmetric(insertion: .scale, removal: .slide))
        }
        .animation(.easeInOut(duration: 0.5), value: showBottleMath)
    }
}
