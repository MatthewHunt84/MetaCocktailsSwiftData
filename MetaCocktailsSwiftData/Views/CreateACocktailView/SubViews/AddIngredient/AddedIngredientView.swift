//
//  AddedIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 3/10/24.
//

import SwiftUI


struct AddedIngredientView: View {
   
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var isShowingAddIngredients: Bool
    
    
    var body: some View {
        
        Section(header: Text("Ingredients")) {
            
            List{
                ForEach(viewModel.addedIngredients, id: \.ingredientBase.name) { ingredient in
                    Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredientBase.name)")
                }
                .onDelete(perform: { indexSet in
                    viewModel.addedIngredients.remove(atOffsets: indexSet)
                })
            }
            Button {
                viewModel.toggleShowIngredientView()
            } label: {
                HStack{
                    Text(viewModel.addedIngredients.count < 2 ? "Add Ingredient" : "Add another ingredient")
                        .tint(viewModel.addedIngredients.count < 2 ? .white : .secondary)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            }
        }
    }
}
#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddedIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true))
        .modelContainer(preview.container)
    
}
