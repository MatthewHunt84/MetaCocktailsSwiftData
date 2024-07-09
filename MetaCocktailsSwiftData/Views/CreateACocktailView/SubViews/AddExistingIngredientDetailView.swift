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
    @Query(sort: \Cocktail.cocktailName) var cocktails: [Cocktail]
    @State private var filteredIngredients: [Ingredient] = []
    

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
                        Text("Add Ingredient")
                            .font(.largeTitle).bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    Form {
                        AddIngredientSearchView(viewModel: viewModel, filteredIngredients: $filteredIngredients, keyboardFocused: _keyboardFocused)
                        AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                        AddExistingIngredientToCocktailButton(viewModel: viewModel)
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) { CreateNewIngredientButton(viewModel: viewModel) }
                        ToolbarItemGroup(placement: .keyboard) {
                            KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                        }
                    }
                    .task {
//                        if !viewModel.startingIngredientsHaveLoaded  {
//                            viewModel.startingIngredients = ingredients
//                            viewModel.startingIngredientsHaveLoaded = true
//                        }
                        keyboardFocused = true
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
    @Binding var filteredIngredients: [Ingredient]
    @FocusState var keyboardFocused: Bool

    @Query(sort: \IngredientModel.name) var ingredients: [IngredientModel]
    @State var filteredIngredients2: [IngredientModel] = []
    
    var body: some View {
        Section("Name") {
            VStack{
                TextField("Ingredient Name", text: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                        viewModel.ingredientName = new
                        filteredIngredients2 = viewModel.matchAllIngredients2(ingredients: ingredients)
                    
                    }
            }
            
            List {
                ForEach(filteredIngredients2, id: \.name) { ingredient in
                    
                    Button {
                        viewModel.ingredientName = ingredient.name
                        viewModel.category = ingredient.category
                        viewModel.ingredientTags = ingredient.tags ?? Tags()
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
        }
    }
}
struct AddMeasurementView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var amountKeyboardFocused: Bool
    var body: some View {
        Section("Amount") {
            HStack {
                TextField("Amount", value: $viewModel.ingredientAmount, formatter: viewModel.formatter)
                    .keyboardType(.decimalPad)
                    .focused($amountKeyboardFocused)
                    
                    
                Menu {
                    ForEach(viewModel.dynamicallyChangeMeasurementOptionsBasedOnChosenCategory(), id: \.self) { unit in
                        Button {
                            viewModel.selectedMeasurementUnit = unit
                        } label: {
                            HStack{
                                Text(unit.rawValue)
                            }
                            
                        }
                        
                    }
                } label: {
                    HStack{
                        Text(viewModel.selectedMeasurementUnit.rawValue)
                            .tint(.white)
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
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Button{
            if viewModel.existingIngredientIsValid() {
                
                let ingredient = Ingredient(viewModel.ingredientName,
                                            ingredientCategory: viewModel.category,
                                            tagsWithSubcategories: viewModel.ingredientTags,
                                            value: viewModel.ingredientAmount,
                                            unit: viewModel.selectedMeasurementUnit,
                                            prep: viewModel.prep, isCustom: viewModel.isCustomIngredient)
                viewModel.addedIngredients.append(ingredient)
                
                if ingredient.isCustom == true {
                    modelContext.insert(ingredient)
                }
                
                viewModel.clearIngredientData()
                dismiss()
            } else {
                viewModel.isShowingingredientAlert.toggle()
            }
            
            
            viewModel.didChooseExistingIngredient = false
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
struct CreateNewIngredientButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    
    var body: some View {
        
        
        NavigationLink {
            AddCustomIngredientView(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack{
                Text("Create Custom Ingredient").font(.headline)
                Image(systemName: "plus")
            }
            .foregroundStyle(.brandPrimaryGold)
        }
        
        
    }
}

struct KeyboardDoneButton: View {
    @FocusState var keyboardFocused: Bool
    @FocusState var amountKeyboardFocused: Bool
    var body: some View {
        HStack{
            Spacer()
            Button("Done") {
                keyboardFocused = false
                amountKeyboardFocused = false
            }
            .tint(Color.brandPrimaryGold)
        }
    }
}

