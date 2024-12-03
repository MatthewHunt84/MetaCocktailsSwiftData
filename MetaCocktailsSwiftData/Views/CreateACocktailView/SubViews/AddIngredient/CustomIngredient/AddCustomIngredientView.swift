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
    @FocusState private var recipeKeyboardFocused: Bool
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                Form {
                    Section(header: Text("Name").font(FontFactory.sectionHeader12)) {
                        TextField("Ingredient Name", text: $viewModel.ingredientName)
                            .focused($keyboardFocused)
                            .font(FontFactory.formLabel18)
                            .autocorrectionDisabled(true)
                    }
                    CategoryPickerView(viewModel: viewModel)
                    AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                    CustomIngredientRecipeView(viewModel: viewModel, recipeKeyboardFocused: _recipeKeyboardFocused)
                    AddCustomIngredientToCocktailButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                }
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Custom Ingredient", dismiss: dismiss)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        HStack{
                            Spacer()
                            Button{
                                keyboardFocused = false
                                amountKeyboardFocused = false
                                recipeKeyboardFocused = false
                            } label: {
                                Text("Done")
                                    .font(FontFactory.fontBody16)
                            }
                            .tint(ColorScheme.interactionTint)
                        }
                    }
                }
                .onAppear {
                    if viewModel.isEdit {
                        amountKeyboardFocused = true
                    } else {
                        keyboardFocused = true
                    }
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
                .tint(.primary)
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
        Section {
            UniversalButton(buttonText: "Add to spec", rightImage: Image(systemName: "plus"), includeBorder: true) {
                if viewModel.customIngredientIsValid(allIngredients: ingredients) {
                    if viewModel.isEdit {
                        viewModel.updateEditedIngredient(isCustom: true)
                    }
                    if !viewModel.isEdit {
                        if !viewModel.prepIngredientRecipe.isEmpty {
                            viewModel.prep = Prep(prepIngredientName: viewModel.ingredientName, prepRecipe: viewModel.prepIngredientRecipe)
                        }
                        if let ingredientValue = viewModel.ingredientAmount {
                            viewModel.addedIngredients.append(Ingredient(ingredientBase: IngredientBase(name: viewModel.ingredientName,
                                                                                                        category: viewModel.category,
                                                                                                        prep: viewModel.prep, isCustom: true),
                                                                         value: ingredientValue,
                                                                         unit: viewModel.selectedMeasurementUnit))
                        }
                    }
                    viewModel.clearIngredientData()
                    isShowingAddIngredients = false
                    isShowingCustomIngredientView = false
                }
            }
            .foregroundStyle(viewModel.customIngredientIsValid(allIngredients: ingredients) ? ColorScheme.interactionTint : Color.secondary)
            .disabled(viewModel.customIngredientIsValid(allIngredients: ingredients) ? false : true)
        }
        .listRowBackground(Color.clear)
    }
}
