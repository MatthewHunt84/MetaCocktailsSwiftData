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
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                MeshGradients.meshRedRibbonBackground.ignoresSafeArea()
                VStack{
                    FontFactory.titleHeader(title: "Add Ingredient")
                    Form {
                        AddIngredientSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                        AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                        AddExistingIngredientToCocktailButton(viewModel: viewModel)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) { CreateNewIngredientButton(viewModel: viewModel) }
                        ToolbarItemGroup(placement: .keyboard) {
                            KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        }
                    }
                    .task {
                        keyboardFocused = true
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
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddExistingIngredientDetailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}

struct AddIngredientSearchView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool

    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @State var filteredIngredients2a: [IngredientBase] = []
    
    var body: some View {
        Section("Name") {
            VStack{
                TextField("Ingredient Name", text: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                        viewModel.ingredientName = new
                        filteredIngredients2a = viewModel.matchAllIngredients2(ingredients: ingredients)
                    
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
                    .listRowBackground(Color.black)
                    
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
        Section(header: Text("Amount").font(FontFactory.sectionHeader)) {
            HStack {
                TextField("Ingredient Volume", value: $viewModel.ingredientAmount, formatter: viewModel.formatter)
                    .keyboardType(.decimalPad)
                    .focused($amountKeyboardFocused)
                    .font(FontFactory.formLabel)

                    
                    
                Menu {
                    ForEach(viewModel.dynamicallyChangeMeasurementOptionsBasedOnChosenCategory(), id: \.self) { unit in
                        
                        Button {
                            viewModel.selectedMeasurementUnit = unit
                        } label: {
                            HStack{
                                Text(unit.rawValue)
                                    .font(FontFactory.formLabel)
                            }
                        }
                    }
                } label: {
                    HStack{
                        Text(viewModel.selectedMeasurementUnit.rawValue)
                            .tint(.white)
                            .font(FontFactory.formLabel)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                    }
                }
            }
        }
    }
}
struct AddExistingIngredientToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    
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
                viewModel.toggleShowIngredientView()
                
            } else {
                viewModel.isShowingingredientAlert.toggle()
                viewModel.didChooseExistingIngredient = false
            }
        } label: {
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.footnote).bold()
                Text("Add to spec")
                    .font(FontFactory.specMeasurement)
            }
            .tint(.blueTint)
            .padding()
        }
        .frame(width: 380, height: 40,  alignment: .center)
    }
}
struct CreateNewIngredientButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    
    var body: some View {
        
        
        NavigationLink {
            AddCustomIngredientView(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack{
                Text("Create Custom Ingredient")
                    .font(FontFactory.bottomToolbarButton)
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
                    .font(FontFactory.body)
            }
            .tint(.blueTint)
        }
    }
}
