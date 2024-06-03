//
//  EditBatchModalView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 6/3/24.
//

import SwiftUI

struct EditBatchModalView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Batch Preferences")
                    .dynamicTypeSize(.xxxLarge)
                    .bold()
                Spacer()
                Button {
                    dismiss()
                } label: {
                    
                    Image(systemName: "x.circle")
                        .dynamicTypeSize(.xxxLarge)
                }
            }
            .padding(.bottom, 20)
            Toggle("Divide ingredient volume into bottles", isOn: $viewModel.isShowingBottleMathMode)
                .padding(.bottom, 20)
            VStack{
                HStack{
                    Text("Included Ingredients:")
                    Spacer()
                }
                List {
                    ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredient.name) { ingredient in
                        
                        LoadedCocktailIngredientCell(ingredient: ingredient)
                        
                    }
                }
                .listStyle(.plain)
                .listRowBackground(Color.black)
            }
            //.padding(.bottom, 20)
            HStack{

                
            }
        }
        .padding()
        .background(Color.black)
        
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    return EditBatchModalView()
        .environmentObject(CBCViewModel())
        .modelContainer(preview.container)
    
}
