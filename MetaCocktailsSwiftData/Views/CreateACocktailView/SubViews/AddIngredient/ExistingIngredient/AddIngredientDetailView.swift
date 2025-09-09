//
//  AddExistingIngredientDetailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/4/24.
//

import SwiftUI
import SwiftData

struct AddIngredientDetailView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    @Binding var isShowingAddIngredients: Bool
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @FocusState private var recipeKeyboardFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                BlackGlassBackgroundView().ignoresSafeArea()

                Form {
                    AddIngredientSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                    if !viewModel.didChooseExistingIngredient {
                        CategoryPickerView(viewModel: viewModel)
                    }
                    AddMeasurementView(viewModel: viewModel, amountKeyboardFocused: _amountKeyboardFocused)
                    
                    if !viewModel.didChooseExistingIngredient {
                        CustomIngredientRecipeView(viewModel: viewModel, recipeKeyboardFocused: _recipeKeyboardFocused)
                    }
                    Section {
                        AddExistingIngredientToCocktailButton(viewModel: viewModel, isShowingAddIngredients: $isShowingAddIngredients)
                    }
                    .listRowBackground(Color.clear)
                   
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        KeyboardDoneButton(keyboardFocused: $keyboardFocused, amountKeyboardFocused: $amountKeyboardFocused)
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Add Ingredient"){
                    viewModel.clearIngredientData()
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
    
    AddIngredientDetailView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true))
        .modelContainer(preview.container)
    
}

struct AddIngredientSearchView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @FocusState var amountKeyboardFocused: Bool
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @State private var isShowingDetail: Bool = false
    
    var body: some View {
        Section {
            VStack{
                TextField("Search for ingredient...", text: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .font(FontFactory.formLabel18)
                    .onChange(of: viewModel.ingredientName) { old, new in
                        viewModel.ingredientName = new
                        viewModel.matchAllIngredients(ingredients: ingredients)
                        
                        if !ingredients.contains(where: { $0.name == viewModel.ingredientName}) {
                            viewModel.didChooseExistingIngredient = false
                        }
                        
                        
                    }
                    .clearSearchButton(text: $viewModel.ingredientName, isEmbeddedInSection: true) {
                        viewModel.ingredientName = ""
                    }
                    .submitLabel(.done)
            }
            if keyboardFocused && !viewModel.didChooseExistingIngredient {
                ForEach(viewModel.filteredIngredients, id: \.name) { ingredient in
                    Button {
                        viewModel.ingredientName = ingredient.name
                        viewModel.category = UmbrellaCategory(rawValue: ingredient.umbrellaCategory) ?? UmbrellaCategory.agaves
                        viewModel.ingredientTags = ingredient.tags ?? Tags()
                        viewModel.info = ingredient.info
                        viewModel.dynamicallyChangeMeasurementUnit()
                        viewModel.didChooseExistingIngredient = true
                        viewModel.filteredIngredients = []
                        keyboardFocused = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            amountKeyboardFocused = true
                        }
                    } label: {
                        Text(ingredient.name)
                    }
                    .foregroundStyle(viewModel.addedIngredients.contains(where: { $0.ingredientBase.name == ingredient.name}) ? Color.gray : .white)
                    .disabled(viewModel.addedIngredients.contains(where: { $0.ingredientBase.name == ingredient.name}) ? true : false )
                    
                }
                .listStyle(.plain)
                .listRowBackground(Color.clear)
            }
        } header: {
            HStack {
                Text("Choose Ingredient")
                    .font(FontFactory.sectionHeader12)
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(isShowingDetail ? ColorScheme.tintColor : ColorScheme.interactionTint)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isShowingDetail.toggle()
                        }
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        if isShowingDetail {
            Section {
                Text("Choose from an existing ingredient or create your own. A custom ingredient will require additional information for search term categorization and optional recipe.")
                    .font(FontFactory.fontBody14)
                    .foregroundStyle(.brandPrimaryGold)
            }
            .listSectionSpacing(0)
            .listRowBackground(Color.clear)
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
                    .onChange(of: viewModel.ingredientAmount) { oldValue, newValue in
                        viewModel.ingredientAmount = newValue
                    }
                
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
        }
    }
}
struct AddExistingIngredientToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Query(sort: \IngredientBase.name) var ingredients: [IngredientBase]
    @Binding  var isShowingAddIngredients: Bool
    
    var body: some View {
        
        UniversalButton(buttonText: "Add to spec", rightImage: nil, includeBorder: true) {
            viewModel.addIngredientToCocktailBuild(ingredients: ingredients)
            isShowingAddIngredients = false
        }
        .foregroundStyle(viewModel.ingredientIsValid(allIngredients: ingredients) ? ColorScheme.interactionTint : Color.secondary)
        .disabled(viewModel.ingredientIsValid(allIngredients: ingredients) ? false : true)
        
    }
}


struct KeyboardDoneButton: View {
    @FocusState.Binding var keyboardFocused: Bool
    @FocusState.Binding var amountKeyboardFocused: Bool
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
