//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var isShowingAddIngredients: Bool
    @FocusState private var keyboardFocused: Bool
    
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.ingredientName)
                .focused($keyboardFocused)
                .onChange(of: viewModel.ingredientName) {
                    viewModel.matchAllPhysicalCocktailComponents()
                }
            List {
                ForEach(viewModel.allPhysicalCocktailComponents, id: \.self) { component in
                    if component.matchesCurrentSearch {
                        Button {
                            viewModel.currentSelectedComponent = component
                            if component.isNA {
                                if let category = component.nACategory {
                                    viewModel.ingredientType = category
                                }
                                viewModel.dynamicallyChangeMeasurementUnit()
                                viewModel.ingredientName = component.name
                            }
                            if component.isSpirit {
                                if let category = component.spiritCategory {
                                    viewModel.ingredientType = category
                                }
                                viewModel.dynamicallyChangeMeasurementUnit()
                                viewModel.ingredientName = component.name
                            }
                            
                            
                        } label: {
                            Text(component.name)
                        }
                    }
                }
            }
            
            
            
            
            HStack {
                TextField("Amount", value: $viewModel.ingredientAmount, formatter: viewModel.formatter).cBCTextField()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Menu(viewModel.selectedMeasurementUnit.rawValue) {
                    ForEach(MeasurementUnit.allCases, id: \.self) { unit in
                        Button {
                            viewModel.selectedMeasurementUnit = unit
                        } label: {
                            Text(unit.rawValue)
                        }
                        
                    }
                }
                .buttonStyle(.bordered)
            }
            
            Button {
                if viewModel.ingredientIsValid() {
                    viewModel.addedIngredients.append(CocktailIngredient(viewModel.validateCurrentSelectedComponent(for: viewModel.currentSelectedComponent) , value: viewModel.ingredientAmount, unit: viewModel.selectedMeasurementUnit))
                    
                    
                    viewModel.clearIngredientData()
                    isShowingAddIngredients.toggle()
                } else {
                    viewModel.isShowingingredientAlert.toggle()
                }
                
            } label: {
                Text("Add to Ingredients")
                
            }
            .alert(isPresented: $viewModel.isShowingingredientAlert, content: {
                Alert(title: Text("Please choose an ingredient and measurement to add."))
            })
            .task {
                viewModel.matchAllPhysicalCocktailComponents()
                keyboardFocused = true
                
            }
            .buttonStyle(BlackNWhiteButton())
            
        }
        
    }
}

#Preview {
    AddIngredientView(viewModel: AddCocktailViewModel(), isShowingAddIngredients: .constant(true))
}
