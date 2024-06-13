//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct CBCLoadedCocktailView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @Binding var cocktailCount: Double
    @FocusState var isInputActive: Bool
    @State private var somethingHappened: Bool = false
    @State private var isShowingPreferencesModal: Bool = false
    
    
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
                                .dynamicTypeSize(.xxxLarge)
                                .bold()
                            Spacer()
                        }
                        
                         
                        HStack{
                            Text("Cocktail Count:")
                            TextField("#", value:  $cocktailCount, formatter: viewModel.formatter).cBCTextField()
                                .autocorrectionDisabled()
                                .keyboardType(.decimalPad)
                                .focused($isInputActive)
                                .onTapGesture {
                                    viewModel.numberOfCocktailsText = 0
                                    cocktailCount = 0
                                }
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
                                isShowingPreferencesModal.toggle()
                                
                            } label: {
                                VStack{
                                    
                                    Image(systemName: "pencil")
                                    Text("Edit")
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    if viewModel.isShowingBottleMathMode == false {
                        List {
                            ForEach($viewModel.quantifiedBatchedIngredients, id: \.self){ ingredient in
                                SimpleBatchCell(quantifiedBatchedIngredient: ingredient)
                            }
                            HStack {
                                Text("Batch Dilution")
                                Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                                    .frame(width: 50)
                                    .onChange(of: viewModel.dilutionPercentage) { oldValue, newValue in
                                        viewModel.dilutionPercentage = newValue
                                        viewModel.convertIngredientsToBatchCellData()
                                        viewModel.doSplitBatchMath()
                                    }
                            }
                            
                            
                        }
                        .listStyle(.plain)
                        .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(.gray.gradient, lineWidth: 2))
                    } else {
                        HStack{
                            Spacer()
                            Text("Bottle Size:")
                                .dynamicTypeSize(.small)
                            Text("# of btls/Remaining mls:")
                                .dynamicTypeSize(.small)
                        }
                        List {
                            ForEach($viewModel.quantifiedBatchedIngredients, id: \.self){ ingredient in
                                BottleBatchCell(quantifiedBatchedIngredient: ingredient)
                            }
                            HStack {
                                Text("Batch Dilution")
                                Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                                    .frame(width: 50)
                                    .onChange(of: viewModel.dilutionPercentage) { oldValue, newValue in
                                        viewModel.dilutionPercentage = newValue
                                        viewModel.convertIngredientsToBatchCellData()
                                        viewModel.doSplitBatchMath()
                                    }
                            }
                        }
                        .listStyle(.plain)
                        .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .stroke(.gray.gradient, lineWidth: 2))
                    }
                    Text("Total Dilution = \(Int(ceil(viewModel.totalDilutionVolume)))ml")
                    Text("Total Volume = \(Int(ceil(viewModel.totalBatchVolume)))ml")
                    NavigationLink {
                       SplitBatchView()
                            .environmentObject(viewModel)
                    } label: {
                        Text("Split Batch")
                    }
                    .buttonStyle(BlackNWhiteButton())
                    
                }
            }
            .sheet(isPresented: $isShowingPreferencesModal, content: {
                EditBatchModalView()
                    .onDisappear(perform: {
                        viewModel.convertIngredientsToBatchCellData()
                        viewModel.doSplitBatchMath()
                    })
            })
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer([Cocktail.self])
    return CBCLoadedCocktailView(cocktailCount: .constant(100.0))
        .environmentObject(CBCViewModel())
        .modelContainer(previewContainer.container)
}
