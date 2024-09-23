//
//  BottleMathModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 9/18/24.
//

import SwiftUI


struct BottleMathModalView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var quantifiedBatchedIngredient: BottleBatchedCellData
    @Binding var isShowingBottleMathModal: Bool
    @State private var bottleSizeText: Int = 0
    @State private var numberOfBottlesText: Int = 0
    @State private var isEditingValues: Bool = false
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        
        ZStack {
            
            BlackGlassBackgroundView().ignoresSafeArea()
            
            VStack {
                
                FontFactory.titleHeader22(title: "Calculate by bottles")
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                Text("How many milliliters in each bottle?")
                    .font(FontFactory.formLabel18)
                
                HStack {
                    TextField("Volume", value: $bottleSizeText, formatter: NumberFormatter())
                        .font(FontFactory.mediumFont(size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(ColorScheme.interactionTint)
                        .padding(.vertical, 5)
                        .focused($keyboardFocused)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
                
                Text("How many full bottles will you be using?")
                    .font(FontFactory.formLabel18)
                
                HStack {
                    
                    Button {
                        if numberOfBottlesText > 0 {
                            numberOfBottlesText -= 1
                        }
                        updateBatchWithBottleMath()
                    } label: {
                        Image(systemName: "minus.circle")
                            .tint(.blueTint)
                            .font(FontFactory.formLabel18)
                    }
                    
                    TextField("Btl. #", value: $numberOfBottlesText, formatter: NumberFormatter())
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .focused($keyboardFocused)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                    
                    Button {
                        numberOfBottlesText += 1
                        updateBatchWithBottleMath()
                    } label: {
                        Image(systemName: "plus.circle")
                            .tint(.blueTint)
                            .font(FontFactory.formLabel18)
                    }
                }
                .padding(.bottom, 30)
                
                Button {
                    updateBatchWithBottleMath()
                    isShowingBottleMathModal = false
                } label : {
                        Text("Calculate")
                            .font(FontFactory.mediumFont(size: 18))
                            .foregroundStyle(numberOfBottlesText > 0 ? ColorScheme.interactionTint : Color.secondary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Capsule().strokeBorder(numberOfBottlesText > 0 ? ColorScheme.interactionTint : Color.secondary, lineWidth: 1))
                            .disabled(numberOfBottlesText > 0 ? false : true)
                }

                Spacer()
            }
        }
        .onAppear {
            bottleSizeText = quantifiedBatchedIngredient.bottleSize
            numberOfBottlesText = quantifiedBatchedIngredient.wholeBottles
        }
    }
    
    private func updateBatchWithBottleMath() {
        if bottleSizeText > 0 && numberOfBottlesText > 0 {
            let totalMls = numberOfBottlesText * bottleSizeText
               
               viewModel.updateIngredientAmount(
                   ingredientName: quantifiedBatchedIngredient.ingredientName,
                   newAmount: totalMls,
                   newBottleSize: bottleSizeText
               )
           }
       }
}

struct BottleMathModalView_Previews: PreviewProvider {
    static var previews: some View {
        @State var sampleIngredient = BottleBatchedCellData(
            id: UUID(),
            ingredientName: "Gin",
            bottleSize: 750,
            wholeBottles: 2,
            remainingMls: 500,
            mlAmount: 45,
            totalMls: 2000
        )
        @State var isShowingModal = true

        return BottleMathModalView(
            quantifiedBatchedIngredient: $sampleIngredient,
            isShowingBottleMathModal: $isShowingModal
        )
        .environmentObject(CBCViewModel())
    }
}

// SwiftUI preview
#Preview {
    BottleMathModalView_Previews.previews
}
