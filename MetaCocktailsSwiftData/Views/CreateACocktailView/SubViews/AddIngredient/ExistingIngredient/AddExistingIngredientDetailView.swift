//
//  AddExistingIngredientDetailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/4/24.
//

import SwiftUI
import SwiftData

struct AddExistingIngredientDetailView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    @Binding var isShowingAddIngredients: Bool
    @Binding var isShowingCustomIngredientView: Bool
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                VStack {
                    List {
                        AddIngredientSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                        Section {
                            AddExistingIngredientToCocktailButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                        }
                        .listRowBackground(Color.clear)
                        Section {
                            CreateNewIngredientButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .background(BlackGlassBackgroundView())
                    .navigationBarTitleDisplayMode(.inline)
                    .jamesHeaderWithNavigation(title: "Add Ingredient", dismiss: dismiss)
                   
                }
                if viewModel.isShowingingredientAlert {
                    CustomAlertView(isActive: $viewModel.isShowingingredientAlert,
                                    title: "Missing name or amount:",
                                    message: "Please add an amount and choose from an existing ingredient. If you'd like to make your own, press 'Create Custom Ingredient'",
                                    buttonTitle: yesChef,
                                    action: {})
                    .zIndex(2)
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

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    AddExistingIngredientDetailView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true), isShowingCustomIngredientView: .constant(true))
        .modelContainer(preview.container)
    
}

struct AddIngredientSearchView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @FocusState var amountKeyboardFocused: Bool
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    
    var body: some View {
        Section(header:  Text("Name").font(FontFactory.sectionHeader12)) {
            VStack{
                TextField("Ingredient Name", text: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .font(FontFactory.formLabel18)
                    .onChange(of: viewModel.ingredientName) { old, new in
                        viewModel.ingredientName = new
                        viewModel.matchAllIngredients(ingredients: ingredients)
                    }
            }
            .onAppear {
                keyboardFocused = true
                viewModel.ingredientName = ""
            }
            if keyboardFocused {
                ForEach(viewModel.filteredIngredients, id: \.name) { ingredient in
                    Button {
                        viewModel.ingredientName = ingredient.name
                        viewModel.category = UmbrellaCategory(rawValue: ingredient.umbrellaCategory) ?? UmbrellaCategory.agaves
                        viewModel.ingredientTags = ingredient.tags ?? Tags()
                        viewModel.info = ingredient.info
                        viewModel.dynamicallyChangeMeasurementUnit()
                        viewModel.didChooseExistingIngredient = true
                        viewModel.filteredIngredients = []
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            amountKeyboardFocused = true
                        }
                    } label: {
                        Text(ingredient.name)
                    }
                    .tint(.primary)
                }
                .listStyle(.plain)
                .listRowBackground(Color.clear)
            }
        }
    }
}
struct AddMeasurementView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var amountKeyboardFocused: Bool
    var body: some View {
        Section(header: Text("Amount").font(FontFactory.sectionHeader12)) {
            HStack {
                TextField("Ingredient Volume", value: $viewModel.ingredientAmount, formatter: viewModel.formatter)
                    .keyboardType(.decimalPad)
                    .focused($amountKeyboardFocused)
                    .font(FontFactory.formLabel18)
                    
                Menu {
                    ForEach(viewModel.dynamicallyChangeMeasurementOptionsBasedOnChosenCategory(), id: \.self) { unit in
                        Button {
                            viewModel.selectedMeasurementUnit = unit
                        } label: {
                            HStack{
                                Text(unit.rawValue)
                                    .font(FontFactory.formLabel18)
                            }
                        }
                    }
                } label: {
                    HStack{
                        Text(viewModel.selectedMeasurementUnit.rawValue)
                            .tint(.primary)
                            .font(FontFactory.formLabel18)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onAppear {
                if viewModel.isEdit {
                    amountKeyboardFocused = true
                }
            }
            
        }
    }
}
struct AddExistingIngredientToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @Binding  var isShowingAddIngredients: Bool
    
    var body: some View {
        
        UniversalBlueButton(buttonText: "Add to spec", image: Image(systemName: "plus")) {
            if viewModel.existingIngredientIsValid(allIngredients: ingredients) {
                viewModel.removeIngredient()
                let ingredient = Ingredient(ingredientBase: IngredientBase(name: viewModel.ingredientName,
                                                                           category: viewModel.category,
                                                                           prep: viewModel.prep),
                                            value: viewModel.ingredientAmount,
                                            unit: viewModel.selectedMeasurementUnit)
                
                viewModel.addedIngredients.append(ingredient)
                
                viewModel.clearIngredientData()
                isShowingAddIngredients = false
            } else {
                viewModel.isShowingingredientAlert.toggle()
                viewModel.didChooseExistingIngredient = false
            }
        }
    }
}
struct CreateNewIngredientButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var isShowingAddIngredients: Bool
    @Binding var isShowingCustomIngredientView: Bool
    var body: some View {
        NavigationLinkWithoutIndicator {
            HStack {
                Text("Create Custom Ingredient")
                Image(systemName: "plus")
                        .tint(ColorScheme.interactionTint)
                
            }
            .font(FontFactory.mediumFont(size: 18))
            .foregroundStyle(ColorScheme.interactionTint)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
        } destination: {
            AddCustomIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                            .navigationBarBackButtonHidden(true)
        }
    }
}

struct KeyboardDoneButton: View {
    @FocusState var keyboardFocused: Bool
    @FocusState var amountKeyboardFocused: Bool
    var body: some View {
        HStack{
            Spacer()
            Button{
                keyboardFocused = false
                amountKeyboardFocused = false
            } label: {
                Text("Done")
                    .font(FontFactory.fontBody16)
            }
            .tint(ColorScheme.interactionTint)
        }
    }
}
