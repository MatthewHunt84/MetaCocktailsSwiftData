//
//  NumberOfCocktailsModal.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 5/4/24.
//

import SwiftUI

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


#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return NumberOfCocktailsModal(cocktail: DummyCocktails.shared.cocktail, isShowingBatchView: .constant(false), isPresented: .constant(true))
        .environmentObject(CBCViewModel())
        .modelContainer(preview.container)
}
