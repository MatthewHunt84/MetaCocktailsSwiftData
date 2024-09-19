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
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.black)
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .ignoresSafeArea()
            VStack {
                FontFactory.titleHeader22(title: "Calculate by number of available bottles:")
                    .padding()
                    .multilineTextAlignment(.center)
                HStack {
                    Text("What volume are the bottles?")
                        .font(FontFactory.formLabel18)
                    TextField("Volume", value: $bottleSizeText, formatter: NumberFormatter())
                        .font(FontFactory.formLabel18)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                        .focused($keyboardFocused)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                    Text("ml")
                        .font(FontFactory.formLabel18)
                }
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
                if !isEditingValues && quantifiedBatchedIngredient.remainingMls != 0 {
                    Text("You'll need to add an extra \(quantifiedBatchedIngredient.remainingMls) mls")
                        .font(FontFactory.formLabel18)
                        .padding()
                }
                Button {
                    isShowingBottleMathModal = false
                } label: {
                    Text("Add to batch")
                }
                .buttonStyle(.customGreyButton)
                .tint(ColorScheme.buttonTint.opacity(0.5))
                .padding()
                .disabled(numberOfBottlesText > 0 ? false : true)
                Spacer()
                if keyboardFocused {
                    HStack {
                        Spacer()
                        Button {
                            keyboardFocused = false
                        } label: {
                            Text("Done")
                                .tint(.blueTint)
                        }
                    }
                }
            }
            .onAppear {
                bottleSizeText = quantifiedBatchedIngredient.bottleSize
                numberOfBottlesText = quantifiedBatchedIngredient.wholeBottles
            }
        }
    }
    
    private func updateBatchWithBottleMath() {
        if bottleSizeText > 0 && numberOfBottlesText >= 0 {
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
