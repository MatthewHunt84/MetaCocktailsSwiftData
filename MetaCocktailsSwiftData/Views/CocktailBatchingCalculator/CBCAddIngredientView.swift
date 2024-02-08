//
//  CBCAddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI

struct CBCAddIngredientView: View {
    @State var ingredientOrDilution: IngredientOrDilution = .ingredient
    @State var mlsOrOunces: MlsOrOunces = .ounces
    @EnvironmentObject var viewModel: CBCViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
           
            VStack {
                Picker("", selection: $ingredientOrDilution) {
                    ForEach(IngredientOrDilution.allCases, id: \.self) {
                        Text($0.rawValue)
                        
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                
                if ingredientOrDilution == .ingredient {
                    HStack{
                        Text("Name:")
                        TextField("Ingredient Name", text: $viewModel.ingredientNameText).cBCTextField()
                            .frame(width: 300, height: 40, alignment: .center)
                           
                    }
                    HStack{
                        Spacer()
                        Text("Amount in")
                        Picker("", selection: $mlsOrOunces) {
                            ForEach(MlsOrOunces.allCases, id: \.self) {
                                Text($0.rawValue)
                                
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        TextField("Amount", text: $viewModel.ingredientAmount).cBCTextField()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
                        
                    }
                    HStack{
                        Spacer()
                        Text("ABV percentage:")
                        TextField("%ABV", text: $viewModel.ingredientAbvPercentage).cBCTextField()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
                    }
                    
                    
                    
                } else {
                    HStack {
                        Text("Dilution Type:")
                        TextField("Usually water", text: $viewModel.dilutionName).cBCTextField()
                        
                    }
                    HStack{
                        Spacer()
                        Text("Percent Amount:")
                        TextField("%Dilution", text: $viewModel.dilutionPercentage).cBCTextField()
                        
                        
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
                    }
                }
                
                Button("Add Ingredient") {
                    
                    
                    if ingredientOrDilution == .ingredient {

                            if mlsOrOunces == .ounces {
                                viewModel.ingredients.append(BatchIngredient(name: viewModel.ingredientNameText, amount: viewModel.ingredientAmount, aBV: viewModel.ingredientAbvPercentage))
                            } else {
                                viewModel.ingredients.append(BatchIngredient(name: viewModel.ingredientNameText, amount: viewModel.convertMlToOz(for: viewModel.ingredientAmount), aBV: viewModel.ingredientAbvPercentage))
                            }

                    }
                    
                    viewModel.ingredientNameText = ""
                    viewModel.ingredientAmount = ""
                    viewModel.ingredientAbvPercentage = ""
                   
                    dismiss()
                    
                }
                .disabled(viewModel.ingredientNameText != "" ? false : true)
                .buttonStyle(BlackNWhiteButton())
                .padding()
                Spacer()
                
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

#Preview {
    CBCAddIngredientView()
        .environmentObject(CBCViewModel())
}

enum IngredientOrDilution: String, CaseIterable {
    
    case ingredient = "Ingredient"
    case dilution = "Dilution"
}

enum MlsOrOunces: String, CaseIterable {
    case mls = "ml."
    case ounces = "oz."
}
