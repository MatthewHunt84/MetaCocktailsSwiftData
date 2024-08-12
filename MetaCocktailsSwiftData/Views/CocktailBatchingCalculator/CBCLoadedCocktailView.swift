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
    @State private var isShowingPreferencesModal: Bool = false
    
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack {
                    CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName, totalBatchVolume: viewModel.totalBatchVolume)
                    VStack {
                        HStack{
                            CocktailCountView(isInputActive: _isInputActive)
                            Spacer()
                            EditIngredientsButton(isShowingIngredientsModal: $isShowingPreferencesModal)
                        }
                    }
                    QuantifiedIngredientsListView()
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

struct CBCCocktailHeaderView: View {
    let cocktailName: String
    let totalBatchVolume: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cocktailName)
                    .dynamicTypeSize(.xxxLarge)
                    .bold()
                Spacer()
            }
            HStack {
                Text("Full Batch:")
                Text("\(Int(ceil(totalBatchVolume)))ml")
                Spacer()
            }
            .dynamicTypeSize(.xxxLarge)
            .bold()
        }
    }
}
struct EditIngredientsButton: View {
    @Binding var isShowingIngredientsModal: Bool
    
    var body: some View {
        Button {
            isShowingIngredientsModal.toggle()
            
        } label: {
            VStack{
                //Text("Edit")
//                Text("Exclude")
//                Text("Ingredients")
                Image(systemName: "gearshape")
                //Text("Ingredients")
            }
            .dynamicTypeSize(.xxLarge).bold()
            .foregroundStyle(.brandPrimaryGold)
            .padding(.horizontal, 15)

            
        }
    }
}

struct CocktailCountView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState var isInputActive: Bool
    
    var body: some View {
        Text("Cocktail Count:")
            .dynamicTypeSize(.large)
            .bold()
        TextField("#", value:  $viewModel.numberOfCocktailsText, formatter: viewModel.formatter)
            .padding(5)
            .autocorrectionDisabled()
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            .keyboardType(.decimalPad)
            .focused($isInputActive)
            .onTapGesture {
                viewModel.numberOfCocktailsText = 0
            }
            .dynamicTypeSize(.large)
         
        
            .toolbar {
                if isInputActive {
                    
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button {
                            viewModel.convertIngredientsToBatchCellData()
                            isInputActive = false
                        } label: {
                            Text("Done")
                                .bold()
                                .foregroundStyle(.blue)
                        }
                    }
                }
            }
            .frame(maxWidth: 75)
    }
}

struct QuantifiedIngredientsListView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    
    var body: some View {
        List {
            ForEach($viewModel.quantifiedBatchedIngredients, id: \.self){ ingredient in
                SimpleBatchCell(quantifiedBatchedIngredient: ingredient)
            }
            VStack{
                HStack {
                    Text("Batch Dilution")
                    Spacer()
                    Text("\(Int(ceil(viewModel.totalDilutionVolume)))ml")
                }
                HStack{
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
            VStack{
                SplitBatchNavigationButton()
                    
            }
        }
        .listStyle(.plain)
    }
}

struct SplitBatchNavigationButton: View {
    @EnvironmentObject var viewModel: CBCViewModel
    var body: some View {
        
        NavigationLinkWithoutIndicator {
            HStack{
                Text("Divide Total Batch")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brandPrimaryGold)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            }
            .foregroundStyle(.brandPrimaryGold)
        } destination: {
            SplitBatchView()
                .environmentObject(viewModel)
        }
    }
}
