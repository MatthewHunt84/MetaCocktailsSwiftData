//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

struct AddIngredientDetailView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocus: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack {
                    HStack{
                        BackButton()
                        Spacer()
                    }
                    Form {
                        Section("Name") {
                            TextField("Ingredient Name", text: $viewModel.ingredientName)
                                .focused($keyboardFocused)
                                .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                                    viewModel.ingredientName = new
                                    viewModel.matchAllPhysicalCocktailComponents()
                                }
                        }
                        List {
                            ForEach(viewModel.allPhysicalCocktailComponents.filter({$0.matchesCurrentSearch}).sorted(by: { $0.name < $1.name }), id: \.self) { component in
                                Button {
                                    viewModel.currentSelectedComponent = component
                                    if component.isNA {
                                        if let ingredientType = component.nACategory {
                                            for categoryName in Category.allCases {
                                                if categoryName.rawValue == ingredientType.category {
                                                    viewModel.category = categoryName
                                                    viewModel.ingredientTags = ingredientType.tags
                                                    viewModel.ingredientName = ingredientType.name
                                                }
                                            }
                                        }
                                        viewModel.dynamicallyChangeMeasurementUnit()
                                        viewModel.ingredientName = component.name
                                        amountKeyboardFocus = true
                                        
                                    }
                                    if component.isSpirit {
                                        if let ingredientType = component.spiritCategory {
                                            for categoryName in Category.allCases {
                                                if categoryName.rawValue == ingredientType.category {
                                                    viewModel.category = categoryName
                                                    viewModel.ingredientTags = ingredientType.tags
                                                    viewModel.ingredientName = ingredientType.name
                                                }
                                            }
                                        }
                                        viewModel.dynamicallyChangeMeasurementUnit()
                                        viewModel.ingredientName = component.name
                                        amountKeyboardFocus = true
                                    }
                                    
                                    
                                } label: {
                                    Text(component.name)
                                        .tint(.white)
                                }
                                
                            }
                            
                            .listStyle(.plain)
                            .listRowBackground(Color.black)
                            
                            
                        }
                        .scrollContentBackground(.hidden)
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
                        Section("Recipe (Optional)") {
                            
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button {
                                if viewModel.ingredientIsValid() {
                                    viewModel.addedIngredients.append(Ingredient(viewModel.ingredientName,
                                                                                 ingredientCategory: viewModel.category,
                                                                                 tagsWithSubcategories: viewModel.ingredientTags,
                                                                                 value: viewModel.ingredientAmount,
                                                                                 unit: viewModel.selectedMeasurementUnit,
                                                                                 prep: viewModel.prep))
                                    viewModel.clearIngredientData()
                                    dismiss()
                                } else {
                                    viewModel.isShowingingredientAlert.toggle()
                                }
                            } label: {
                                HStack {
                                    Text("Add ingredient").font(.headline)
                                        .foregroundStyle(viewModel.ingredientIsValid() ? .brandPrimaryGold : .secondary)
                                    Image(systemName: "plus")
                                        
                                }
                                .foregroundStyle(viewModel.ingredientIsValid() ? .brandPrimaryGold : .secondary)
                                
                                
                                
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
                        viewModel.matchAllPhysicalCocktailComponents()
                        keyboardFocused = true
                    }
                }
                
                if viewModel.isShowingingredientAlert {
                    CustomAlertView(isActive: $viewModel.isShowingingredientAlert,
                                    title: "",
                                    message: "Please choose an ingredient and measurement to add.",
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
    
    return AddIngredientDetailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}
