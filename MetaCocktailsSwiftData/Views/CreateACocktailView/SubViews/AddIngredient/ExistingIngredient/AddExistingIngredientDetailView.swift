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
            ZStack{
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                Form {
                    AddIngredientSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                    AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                    AddExistingIngredientToCocktailButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Add Ingredient", dismiss: dismiss)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            keyboardFocused = false
                            amountKeyboardFocused = false
                        }
                        .tint(.blueTint)
                    }
                    ToolbarItem(placement: .bottomBar) { CreateNewIngredientButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                    }
                }
                if viewModel.isShowingingredientAlert {
                    CustomAlertView(isActive: $viewModel.isShowingingredientAlert,
                                    title: "",
                                    message: "Please add an amount and choose from an existing ingredient. If you'd like to make your own, press 'Create Custom Ingredient'",
                                    buttonTitle: "Heard, Chef",
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
    
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @State var filteredIngredients2a: [IngredientBase] = []
    
    var body: some View {
        Section(header:  Text("Name").font(FontFactory.sectionHeader12)) {
            VStack{
                TextField("Ingredient Name", text: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .font(FontFactory.formLabel18)
                    .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                        viewModel.ingredientName = new
                        filteredIngredients2a = viewModel.matchAllIngredients(ingredients: ingredients)
                        
                    }
                
            }
            if keyboardFocused {
                List {
                    ForEach(filteredIngredients2a, id: \.name) { ingredient in
                        
                        Button {
                            viewModel.ingredientName = ingredient.name
                            viewModel.category = UmbrellaCategory(rawValue: ingredient.umbrellaCategory) ?? UmbrellaCategory.agaves
                            viewModel.ingredientTags = ingredient.tags ?? Tags()
                            viewModel.info = ingredient.info
                            viewModel.dynamicallyChangeMeasurementUnit()
                            keyboardFocused = false
                            viewModel.didChooseExistingIngredient = true
                        } label: {
                            Text(ingredient.name)
                        }
                        .tint(.white)
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            } else {
                EmptyView()
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
                            .tint(.white)
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
        Button{
            if viewModel.existingIngredientIsValid(allIngredients: ingredients) {
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
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Add to spec")
                    .font(FontFactory.specMeasurement16B)
            }
            .tint(.blueTint)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}
struct CreateNewIngredientButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var isShowingAddIngredients: Bool
    @Binding var isShowingCustomIngredientView: Bool
    var body: some View {
        
        
        NavigationLink {
            AddCustomIngredientView(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients, isShowingCustomIngredientView: $isShowingCustomIngredientView)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack{
                Text("Create Custom Ingredient")
                    .font(FontFactory.bottomToolbarButton20)
                Image(systemName: "plus")
            }
            .foregroundStyle(.blueTint)
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
            .tint(.blueTint)
        }
    }
}
