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
    @Binding var isShowingAddIngredients: Bool
    @Binding var isShowingCustomIngredientView: Bool 
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                
                Form {
                    Section(header: Text("Name").font(FontFactory.sectionHeader12)) {
                        TextField("Ingredient Name", text: $viewModel.ingredientName)
                            .focused($keyboardFocused)
                            .font(FontFactory.formLabel18)
                            .autocorrectionDisabled(true)
                    }
                    CategoryPickerView(viewModel: viewModel)
                    AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                    CustomIngredientRecipeView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                    AddCustomIngredientToCocktailButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                }
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Custom Ingredient", dismiss: dismiss)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                            .background(Color.clear)
                    }
                }
                .onAppear {
                    if viewModel.isEdit {
                        amountKeyboardFocused = true
                    } else {
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
    
    AddCustomIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true), isShowingCustomIngredientView: .constant(true))
        .modelContainer(preview.container)
    
}
struct CategoryPickerView: View {
    @Bindable var viewModel: AddCocktailViewModel
    var body: some View {
        Section(header: Text("Category").font(FontFactory.sectionHeader12)) {
            HStack{
                Menu {
                    ForEach(UmbrellaCategory.allCases, id: \.self) { category in
                        
                        Button("\(category.rawValue)") {
                            viewModel.category = category
                            viewModel.dynamicallyChangeMeasurementUnit()
                        }
                    }
                } label: {
                    HStack{
                        Text(viewModel.category.rawValue)
                            .font(FontFactory.formLabel18)
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
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @Binding var isShowingAddIngredients: Bool
    @Binding var isShowingCustomIngredientView: Bool
    
    var body: some View {
        Button{
            if viewModel.customIngredientIsValid(allIngredients: ingredients) {
                viewModel.removeIngredient()
                if !viewModel.prepIngredientRecipe.isEmpty {
                    viewModel.prep = Prep(prepIngredientName: viewModel.ingredientName, prepRecipe: viewModel.prepIngredientRecipe)
                }
                viewModel.addedIngredients.append(Ingredient(ingredientBase: IngredientBase(name: viewModel.ingredientName,
                                                                                            category: viewModel.category,
                                                                                            prep: viewModel.prep, isCustom: true),
                                                             value: viewModel.ingredientAmount,
                                                             unit: viewModel.selectedMeasurementUnit))
                                                  
                viewModel.clearIngredientData()
                isShowingAddIngredients = false
                isShowingCustomIngredientView = false
            } else {
                viewModel.isShowingingredientAlert.toggle()
            }
            
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.headline).bold()
                Text("Add to spec")
                    .font(FontFactory.formLabel18)
            }
            .tint(.blueTint)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}
