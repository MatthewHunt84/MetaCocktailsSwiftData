//
//  CBCAddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI

struct CBCAddIngredientView: View {
    @State var ingredientOrDilution: IngredientOrDilution = .ingredient
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
                        
                    }
                    HStack{
                        Spacer()
                        Text("Amount in ounces:")
                        TextField("Oz. amount", text: $viewModel.ingredientAmount).cBCTextField()
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
                        if viewModel.ingredientNameText != ""{
                            viewModel.ingredients.append(BatchIngredient(name: viewModel.ingredientNameText, amount: viewModel.ingredientAmount, aBV: viewModel.ingredientAbvPercentage))
                        }
                    }
                    viewModel.calculateABV()
                    viewModel.ingredientNameText = ""
                    viewModel.ingredientAmount = ""
                    viewModel.ingredientAbvPercentage = ""
                    dismiss()
                    
                }
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

