//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI

struct CBCLoadedCocktailView: View {
    @EnvironmentObject var viewModel: CBCViewModel
   
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
                            TextField("#", value:  $viewModel.numberOfCocktailsText, formatter: viewModel.formatter).cBCTextField()
                                .autocorrectionDisabled()
                                .keyboardType(.decimalPad)
                                .focused($isInputActive)
                                .onTapGesture {
                                }
                            
                                .toolbar {
                                    if isInputActive {
                                        
                                        ToolbarItemGroup(placement: .keyboard) {
                                            Spacer()
                                            
                                            Button {
                                                viewModel.convertIngredientsToBatchCellData()
                                                isInputActive = false
                                            } label: {
                                                Text("Done")
                                                    .foregroundStyle(.red)
                                            }
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
                                    }
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
                    }.simultaneousGesture(TapGesture().onEnded {
                        viewModel.doSplitBatchMath()
                    })
                    .buttonStyle(BlackNWhiteButton())
                    
                }
            }
            .sheet(isPresented: $isShowingPreferencesModal, content: {
                EditBatchModalView()
                    .onDisappear(perform: {
                        viewModel.convertIngredientsToBatchCellData()
                       
                    })
            })
        }
    }
}

#Preview {
    let previewContainer = PreviewContainer([Cocktail.self])
    return CBCLoadedCocktailView()
        .environmentObject(CBCViewModel())
        .modelContainer(previewContainer.container)
}
