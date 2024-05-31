//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct CBCLoadedCocktailView: View {
    @Binding var viewModel: CBCViewModel
    @Binding var cocktailCount: Double
    @FocusState var isInputActive: Bool
    @State private var somethingHappened: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    HStack {
                        Text("Full Batch")
                            .font(.largeTitle).bold()
                        Spacer()
                    }
                    VStack {
                        HStack{
                            Text(viewModel.loadedCocktailData.cocktailName)
                                .dynamicTypeSize(.xxLarge)
                            Spacer()
                        }
                        
                         
                        HStack{
                            Text("Cocktail Count:")
                            TextField("#", value:  $cocktailCount, formatter: viewModel.formatter).cBCTextField()
                                .onSubmit {
                                    viewModel.numberOfCocktailsText = cocktailCount
                                    viewModel.convertIngredientsToBatchCellData()
                                    viewModel.doSplitBatchMath()
                                }
                                .autocorrectionDisabled()
                                .keyboardType(.decimalPad)
                                .focused($isInputActive)
                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard) {
                                        Spacer()

                                        Button("Done") {
                                            viewModel.numberOfCocktailsText = cocktailCount
                                            viewModel.convertIngredientsToBatchCellData()
                                            viewModel.doSplitBatchMath()
                                            
                                            isInputActive = false
                                        }
                                    }
                                }

                                .frame(maxWidth: 75)
                            Spacer()
                            Button {
                                
                                
                            } label: {
                                VStack{
                                    
                                    Image(systemName: "pencil")
                                    Text("Edit")
                                }
                            }
//                            Text("Include:")
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    
                    List {
//                        ForEach($viewModel.loadedCocktailData.ingredients, id: \.ingredient.ingredient.name) { ingredient in
//                            
//                            LoadedCocktailIngredientCell(ingredient: ingredient)
//                        
//                        }
                        ForEach($viewModel.quantifiedBatchedIngredients, id: \.self){ ingredient in
                            SimpleBatchCell(viewModel: $viewModel, quantifiedBatchedIngredient: ingredient)
                        }
                        HStack {
                            Text("Batch Dilution")
                            Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                
                            Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                                .frame(width: 50)
                        }
                        
                        
                    }
                    .listStyle(.plain)
                    .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.gray.gradient, lineWidth: 2))
                    Text("Total Dilution = \(Int(ceil(viewModel.totalDilutionVolume)))ml")
                    Text("Total Volume = \(Int(ceil(viewModel.totalBatchVolume)))ml")
                    NavigationLink {
                       SplitBatchView()
                            .environmentObject(viewModel)
                    } label: {
                        Text("Split Batch")
                    }
                    .buttonStyle(BlackNWhiteButton())
//                    VStack {
//                            NavigationLink{
//                                MainBatchView(cocktailCount: $viewModel.numberOfCocktailsText)
//                                    .environmentObject(viewModel)
//                            } label: {
//                                Text("Batch")
//                            }
//                            .buttonStyle(BlackNWhiteButton())
//                        }
                    
                    
                }
//                .task {
//                    viewModel.numberOfCocktailsText = cocktailCount
//                    viewModel.convertIngredientsToBatchCellData()
//                }
                
            }
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer([Cocktail.self])
    return CBCLoadedCocktailView(viewModel:.constant(CBCViewModel()), cocktailCount: .constant(100.0))
        .environmentObject(CBCViewModel())
        .modelContainer(previewContainer.container)
}
