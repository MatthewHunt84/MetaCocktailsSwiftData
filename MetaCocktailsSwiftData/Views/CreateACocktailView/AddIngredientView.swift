//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Bindable var viewModel = AddCocktailViewModel()
    @Binding var isShowingAddIngredients: Bool
    @FocusState private var keyboardFocused: Bool
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.ingredientName)
                //.focused($keyboardFocused)
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
                if viewModel.currentSelectedComponent.isSpirit {
                    viewModel.addedIngredients.append(CocktailIngredient(viewModel.currentSelectedComponent.spiritCategory ?? IngredientType.vodkas(.vodkaAny), value: viewModel.ingredientAmount, unit: viewModel.selectedMeasurementUnit))
                } else {
                    viewModel.addedIngredients.append(CocktailIngredient(viewModel.currentSelectedComponent.nACategory ?? IngredientType.juices(.carrotJuice), value: viewModel.ingredientAmount, unit: viewModel.selectedMeasurementUnit))
                }
                for ingredients in viewModel.addedIngredients {
                    print("\(ingredients.value) \(ingredients.unit) \(ingredients.ingredient.name)")
                }
                viewModel.ingredientName = ""
                viewModel.ingredientType = IngredientType.agaves(.elTesoroRepo)
                viewModel.ingredientAmount = 0
                viewModel.selectedMeasurementUnit = .fluidOunces
                
                isShowingAddIngredients.toggle()
               
            } label: {
                Text("Add to Ingredients")
                
            }
            .task {
                viewModel.matchAllPhysicalCocktailComponents()
                keyboardFocused = true
                
            }
            .buttonStyle(BlackNWhiteButton())
        }
        
    }
}

#Preview {
    AddIngredientView(isShowingAddIngredients: .constant(true))
}
