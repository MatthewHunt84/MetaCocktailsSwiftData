//
//  CBCAddIngredientView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/5/24.
//

import SwiftUI

//struct CBCAddIngredientView: View {
//    @State var ingredientOrDilution: IngredientOrDilution = .ingredient
//    @State var mlsOrOunces: MlsOrOunces = .ounces
//    @EnvironmentObject var viewModel: CBCViewModel
//    @Environment(\.dismiss) private var dismiss
//    @Bindable var savedBatchCocktail: BatchedCocktail
//    @State private var changedDilutionName = ""
//    @State private var changedDilutionAmount = 0.0
//    
//    
//    var body: some View {
//        ZStack {
//           
//            VStack {
//                Picker("", selection: $ingredientOrDilution) {
//                    ForEach(IngredientOrDilution.allCases, id: \.self) {
//                        Text($0.rawValue)
//                        
//                    }
//                }
//                .pickerStyle(.segmented)
//                .padding()
//                
//                
//                if ingredientOrDilution == .ingredient {
//                    VStack{
//                        HStack{
//                            Text("Name:")
//                            TextField("Ingredient Name", text: $viewModel.ingredientNameText).cBCTextField()
//                                .autocorrectionDisabled()
//                                
//                            
//                        }
//                        HStack{
//                            Spacer()
//                            Text("Amount in")
//                            Picker("", selection: $mlsOrOunces) {
//                                ForEach(MlsOrOunces.allCases, id: \.self) {
//                                    Text($0.rawValue)
//                                    
//                                }
//                            }
//                            .pickerStyle(.segmented)
//                            .padding()
//                            TextField("Amount", value: $viewModel.ingredientAmount, formatter: viewModel.formatter).cBCTextField()
//                                .autocorrectionDisabled()
//                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
//                            
//                        }
//                        HStack{
//                            Spacer()
//                            Text("ABV percentage:")
//                            TextField("%ABV", value: $viewModel.ingredientAbvPercentage, formatter: viewModel.formatter).cBCTextField()
//                                .autocorrectionDisabled()
//                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
//                        }
//                        
//                    }
//                    
//                } else {
//                    HStack {
//                        Text("Dilution Type:")
//                        TextField("Usually water", text: $changedDilutionName).cBCTextField()
//                            .autocorrectionDisabled()
//                    }
//                    HStack{
//                        Spacer()
//                        Text("Percent Amount:")
//                        TextField("%Dilution", value: $changedDilutionAmount, formatter: viewModel.formatter).cBCTextField()
//                            .autocorrectionDisabled()
//                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: .center)
//                    }
//                }
//                
//                Button("Add Ingredient") {
//                    viewModel.appendCorrectIngredient(for: savedBatchCocktail, ingredientOrDilution, mlsOrOunces, changedDilutionName, changedDilutionAmount)
//                    dismiss()
//                    
//                }
//                //.disabled(viewModel.ingredientNameText != "" || viewModel.dilutionName != "" ? false : true)
//                .buttonStyle(BlackNWhiteButton())
//                .padding()
//                Spacer()
//                
//            }
//            .task {
//                changedDilutionName = viewModel.dilutionName
//            }
//            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
//        }
//    }
//}
//
//#Preview {
//    CBCAddIngredientView(savedBatchCocktail: BatchedCocktail(batchCocktailName: "", dilutionPercentage: 0.0, dilutionType: "", notes: "", batchCocktailIngredients: []))
//        .environmentObject(CBCViewModel())
//}
//
//enum IngredientOrDilution: String, CaseIterable {
//    
//    case ingredient = "Ingredient"
//    case dilution = "Dilution"
//}
//
//enum MlsOrOunces: String, CaseIterable {
//    case mls = "ml."
//    case ounces = "oz."
//}
