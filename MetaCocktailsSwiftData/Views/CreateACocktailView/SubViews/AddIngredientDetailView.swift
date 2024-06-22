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
        ZStack{
            
            VStack {
                HStack{
                    BackButton()
                    Spacer()
                }
                
                SearchBarView(searchText: $viewModel.ingredientName)
                    .focused($keyboardFocused)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    .onChange(of: viewModel.ingredientName, initial: true) { old, new in
                        viewModel.ingredientName = new
                        viewModel.matchAllPhysicalCocktailComponents()
                    }
                
                    
                List {
                    ForEach(viewModel.allPhysicalCocktailComponents.filter({$0.matchesCurrentSearch}).sorted(by: { $0.name < $1.name }), id: \.self) { component in
                            Button {
                                viewModel.currentSelectedComponent = component
                                if component.isNA {
                                    if let category = component.nACategory {
                                        viewModel.ingredientType = category
                                    }
                                    viewModel.dynamicallyChangeMeasurementUnit()
                                    viewModel.ingredientName = component.name
                                    amountKeyboardFocus = true
                                }
                                if component.isSpirit {
                                    if let category = component.spiritCategory {
                                        viewModel.ingredientType = category
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
                
                
                
                
                
                HStack {
                    TextField("Amount", value: $viewModel.ingredientAmount, formatter: viewModel.formatter).cBCTextField()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .keyboardType(.decimalPad)
                        .focused($amountKeyboardFocus)
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
                        viewModel.addedIngredients.append(CocktailIngredient(viewModel.validateCurrentSelectedComponent(for: viewModel.currentSelectedComponent),
                                                                             value: viewModel.ingredientAmount, 
                                                                             unit: viewModel.selectedMeasurementUnit))
                        viewModel.clearIngredientData()
                        dismiss()
                    } else {
                        viewModel.isShowingingredientAlert.toggle()
                    }
                    
                } label: {
                    Text("Add to Ingredients")
                    
                }
                .task {
                    viewModel.matchAllPhysicalCocktailComponents()
                    keyboardFocused = true
                    
                }
                .buttonStyle(BlackNWhiteButton())
                
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

#Preview {
    let preview = PreviewContainer([Cocktail.self], isStoredInMemoryOnly: true)
    
    return AddIngredientDetailView(viewModel: AddCocktailViewModel())
        .modelContainer(preview.container)
    
}
