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
                ForEach(viewModel.addedIngredients, id: \.id) { ingredient in
                    if ingredient.ingredient.name != "Custom Ingredient" {
                        Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.ingredient.name)")
                    } else {
                        Text("\(NSNumber(value: ingredient.value)) \(ingredient.unit.rawValue) \(ingredient.customIngredientName!)")
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    viewModel.addedIngredients.remove(atOffsets: indexSet)
                })
            }
            NavigationLinkWithoutIndicator {
                HStack{
                    Text(viewModel.addedIngredients.count < 2 ? "Add Ingredient" : "Add another ingredient")
                        .tint(viewModel.addedIngredients.count < 2 ? .white : .secondary)
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.brandPrimaryGold)
                }
            } destination: {
                AddIngredientDetailView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddedIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true))
        .modelContainer(preview.container)
    
}
