//
//  AddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/26/24.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Bindable var viewModel = CreateACocktailViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.allPhysicalCocktailComponents, id: \.self) { component in
                    if component.matchesCurrentSearch {
                        Button {
                            viewModel.ingredientName = component.name
                            viewModel.currentSelectedComponent = component
                            if component.isNA {
                                viewModel.ingredientType = component.nACategory ?? IngredientType.juices(.carrotJuice)
                            }
                            if component.isSpirit {
                                viewModel.ingredientType = component.spiritCategory ?? IngredientType.vodkas(.vodkaAny)
                            }
                            
                        } label: {
                            Text(component.name)
                        }
                    }
                }
            }
            
            Text("Ingredient Type: \(viewModel.ingredientType.category)")
            
            SearchBarView(searchText: $viewModel.ingredientName)
                .onChange(of: viewModel.ingredientName) {
                    viewModel.matchAllPhysicalCocktailComponents()
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
                    print("\(ingredients.value) \(ingredients.unit)\(ingredients.ingredient.name)")
                }
                viewModel.ingredientName = ""
                viewModel.ingredientType = IngredientType.agaves(.elTesoroRepo)
                viewModel.ingredientAmount = 0
                viewModel.selectedMeasurementUnit = .fluidOunces
                
                
                dismiss()
            } label: {
                Text("Add to Ingredients")
                
            }
            .buttonStyle(BlackNWhiteButton())
        }
    }
}

#Preview {
    AddIngredientView()
}
