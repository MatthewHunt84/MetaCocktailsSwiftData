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
                .bold()
                .padding(.bottom, 20)
            VStack{
                HStack{
                    Text("Included Ingredients:")
                        .bold()
                    Spacer()
                }
                List {
                    ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredientBase.name) { ingredient in
                        
                        LoadedCocktailIngredientCell(ingredient: ingredient)
                        
                    }
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                
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
