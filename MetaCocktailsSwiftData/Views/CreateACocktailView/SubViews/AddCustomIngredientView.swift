//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI
import SwiftData

struct AddCustomIngredientView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    HStack{
                        BackButton()
                        Spacer()
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Custom Ingredient")
                            .font(.largeTitle).bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    Form {
                        Section("Name") {
                            TextField("Ingredient Name", text: $viewModel.ingredientName)
                                .focused($keyboardFocused)
                        }
                        CategoryPickerView(viewModel: viewModel)
                        AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                        IngredeientRecipeView(viewModel: viewModel)
                        AddCustomIngredientToCocktailButton(viewModel: viewModel)
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        }
                    }
                    .task {
                        keyboardFocused = true
                    }
                }
                
                if viewModel.isShowingingredientAlert {
                    CustomAlertView(isActive: $viewModel.isShowingingredientAlert,
                                    title: "",
                                    message: "Please choose a unique ingredient name, a category, and an amount.",
                                    buttonTitle: "Heard, Chef",
                                    action: {})
                    .zIndex(2)
                }
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddCustomIngredientView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}
struct CategoryPickerView: View {
    @Bindable var viewModel: AddCocktailViewModel
    var body: some View {
        Section("Category") {
            HStack{
                Menu {
                    ForEach(Category.allCases, id: \.self) { category in
                        
                        Button("\(category.rawValue)") {
                            viewModel.category = category
                            viewModel.dynamicallyChangeMeasurementUnit()
                        }
                    }
                } label: {
                    HStack{
                        Text(viewModel.category.rawValue)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                        Spacer()
                        
                    }
                }
                .tint(.white)
            }
        }
    }
}
struct AddCustomIngredientToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    
    var body: some View {
        Button{
            if viewModel.customIngredientIsValid(allIngredients: ingredients) {
                viewModel.prep = Prep(prepIngredientName: viewModel.ingredientName, prepRecipe: viewModel.prepIngredientRecipe)
                viewModel.addedIngredients.append(Ingredient(ingredientBase: IngredientBase(name: viewModel.ingredientName,
                                                                                            category: viewModel.category,
                                                                                            prep: viewModel.prep),
                                                             value: viewModel.ingredientAmount,
                                                             unit: viewModel.selectedMeasurementUnit,
                                                             isCustom: viewModel.isCustomIngredient,
                                                             info: nil))
                                                  
                viewModel.clearIngredientData()
                viewModel.isCustomIngredient = true
                dismiss()
            } else {
                viewModel.isShowingingredientAlert.toggle()
            }
            
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Add to spec")
                    .font(.footnote).bold()
            }
            .tint(.brandPrimaryGold)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}
