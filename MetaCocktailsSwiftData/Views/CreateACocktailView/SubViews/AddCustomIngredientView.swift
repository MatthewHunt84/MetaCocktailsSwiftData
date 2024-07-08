//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

struct AddCustomIngredientView: View {
    
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
                            IngredeientRecipeView(viewModel: viewModel)
                        }
                        
                        Button{
                            if viewModel.customIngredientIsValid() {
                                viewModel.prep = Prep(prepIngredientName: viewModel.ingredientName, prepRecipe: viewModel.prepIngredientRecipe)
                                viewModel.addedIngredients.append(Ingredient(viewModel.ingredientName,
                                                                             ingredientCategory: viewModel.category,
                                                                             tagsWithSubcategories: viewModel.ingredientTags,
                                                                             value: viewModel.ingredientAmount,
                                                                             unit: viewModel.selectedMeasurementUnit,
                                                                             prep: viewModel.prep))
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
                    .toolbar {
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
