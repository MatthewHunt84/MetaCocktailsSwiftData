//
//  NumberOfCocktailsModal.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/4/24.
//

import SwiftUI
import SwiftData

struct NumberOfCocktailsModal: View {
    var cocktail: Cocktail
    @ObservedObject var viewModel = CBCViewModel()
    @FocusState private var cocktailNumberFocus: Bool 
    @Binding var isShowingBatchView: Bool
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                Text("How many cocktails are you batching?")
                    .dynamicTypeSize(.xLarge)
                
                TextField("Amount", value: $viewModel.numberOfCocktailsText, formatter: viewModel.formatter).cBCTextField()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .keyboardType(.decimalPad)
                    .focused($cocktailNumberFocus)
                Text("*You can always change this number later")
                    .dynamicTypeSize(.small)
                Button {
                    isShowingBatchView.toggle()
                    dismiss()
                } label: {
                    Text("Batch")
                }
                
            }
            .task {
                cocktailNumberFocus = true 
            }
        }
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    return NumberOfCocktailsModal(cocktail: cocktails.first ?? DummyCocktails.randomCocktail(),
                                  isShowingBatchView: .constant(false),
                                  isPresented: .constant(true))
    .environmentObject(CBCViewModel())
}
