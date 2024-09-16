//
//  SimpleBatchCell.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/30/24.
//

import SwiftUI

import SwiftUI

struct BatchCellView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @State private var showBottleMath: Bool = false
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack {
                    Image(systemName: showBottleMath ? "chevron.down" : "chevron.right")
                        .foregroundStyle(ColorScheme.interactionTint)
                    Text(quantifiedBatchedIngredient.ingredientName)
                        .font(FontFactory.formLabel18)
                        .foregroundStyle(.white)
                    Spacer()
                    if viewModel.editingIngredient == quantifiedBatchedIngredient.ingredientName {
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
                .onTapGesture {
                    if !isFocused {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showBottleMath.toggle()
                        }
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


struct BatchCellViewPreview: View {
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
            BatchCellView(
                quantifiedBatchedIngredient: .constant(
                    BottleBatchedCellData(
                        ingredientName: "Creme de Cacao",
                        whole1LBottles: 2.1,
                        remaining1LMls: 900,
                        whole750mlBottles: 1.2,
                        remaining750mLs: 34,
                        mlAmount: 55,
                        totalMls: 786
                    )
                ),
                isFocused: $isFocused
            )
            .environmentObject(CBCViewModel())
        }
    }
}

#Preview {
    BatchCellViewPreview()
}

struct BottleMathView: View {
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @Binding var showBottleMath: Bool
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            
            OneLiterBottleView(quantifiedBatchedIngredient: $quantifiedBatchedIngredient)
            
            SevenFiftyBottleView(quantifiedBatchedIngredient: $quantifiedBatchedIngredient)
        }
        .animation(.easeInOut(duration: 0.5), value: showBottleMath)
    }
}

struct OneLiterBottleView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @State private var buttonBackgroundColor = ColorScheme.buttonTint
    
    var body: some View {
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
            .tint(buttonBackgroundColor)
            Button {
                if quantifiedBatchedIngredient.whole1LBottles != 0 {
                    viewModel.doMathForModified1LBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole1LBottles - 1)
                }
            } label: {
                Image(systemName: "arrow.down.circle")
            }
            .buttonStyle(.bordered)
            .tint(buttonBackgroundColor)
        }
        .foregroundStyle(.brandPrimaryGold)
        .transition(.asymmetric(insertion: .scale, removal: .slide))
    }
}

struct SevenFiftyBottleView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @State private var buttonBackgroundColor = ColorScheme.buttonTint
    
    var body: some View {
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
            .tint(buttonBackgroundColor)
            Button {
                if quantifiedBatchedIngredient.whole750mlBottles != 0 {
                    viewModel.doMathForModified750mlBottleCount(initialAmount: Double(quantifiedBatchedIngredient.mlAmount), newQuantityAmount: quantifiedBatchedIngredient.whole750mlBottles - 1)
                }
            } label: {
                Image(systemName: "arrow.down.circle")
            }
            .buttonStyle(.bordered)
            .tint(buttonBackgroundColor)
        }
        .foregroundStyle(ColorScheme.selectedColor)
        .transition(.asymmetric(insertion: .scale, removal: .slide))
    }
}
