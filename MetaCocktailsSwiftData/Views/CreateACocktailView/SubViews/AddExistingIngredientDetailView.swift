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
    @FocusState private var amountKeyboardFocus: Bool
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
                        Section("Name") {
                            TextField("Ingredient Name", text: $viewModel.ingredientName)
                                .focused($keyboardFocused)
                                .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                                    viewModel.ingredientName = new
                                    filteredIngredients = viewModel.matchAllIngredients(ingredients: viewModel.startingIngredients)
//
                                }
                            
                        }
                     
                            List {
                                ForEach(filteredIngredients, id: \.id) { ingredient in
                                    
                                    Button {
                                        viewModel.ingredientName = ingredient.name
                                        viewModel.category = ingredient.category
                                        viewModel.ingredientTags = ingredient.tags ?? Tags()
                                        viewModel.dynamicallyChangeMeasurementUnit()
                                        amountKeyboardFocus = true
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
                        
                        Section("Amount") {
                            HStack {
                                TextField("Amount", value: $viewModel.ingredientAmount, formatter: viewModel.formatter)
                                    .keyboardType(.decimalPad)
                                    .focused($amountKeyboardFocus)
                                    
                                Menu {
                                    ForEach(MeasurementUnit.allCases, id: \.self) { unit in
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
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                           
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
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                amountKeyboardFocus = false
                                keyboardFocused = false
                            }
                            .tint(Color.brandPrimaryGold)
                        }
                        
                    }
                    
                    .task {
                        if viewModel.timesInitialIngredientsHaveLoaded == 0 {
                            viewModel.startingIngredients = viewModel.getAllCocktailIngredients(cocktails: cocktails)
                            keyboardFocused = true
                            viewModel.timesInitialIngredientsHaveLoaded = 1
                            
                        }
                        
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
