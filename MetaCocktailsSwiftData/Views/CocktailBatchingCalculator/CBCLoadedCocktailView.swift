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
                    CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName, totalBatchVolume: viewModel.totalBatchVolume)
                    VStack {
                        HStack{
                            CocktailCountView(isInputActive: _isInputActive)
                            Spacer()
                            EditIngredientsButton(isShowingIngredientsModal: $isShowingPreferencesModal)
                        }
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
                    }
                    QuantifiedIngredientsListView()
                    SplitBatchNavigationButton()
                        .padding(.horizontal, 40)
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
            HStack{
                Text("Edit")
                Image(systemName: "pencil")
                //Text("Ingredients")
            }
        }
    }
}

struct CocktailCountView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState var isInputActive: Bool
    
    var body: some View {
        Text("Cocktail Count:")
        TextField("#", value:  $viewModel.numberOfCocktailsText, formatter: viewModel.formatter).cBCTextField()
            .autocorrectionDisabled()
            
            .keyboardType(.decimalPad)
            .focused($isInputActive)
            .onTapGesture {
                viewModel.numberOfCocktailsText = 0
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
                                .foregroundStyle(.brandPrimaryGold)
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
        }
        .listStyle(.plain)
    
//        .overlay( RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
//            .stroke(.gray.gradient, lineWidth: 2))
    }
}

struct SplitBatchNavigationButton: View {
    @EnvironmentObject var viewModel: CBCViewModel
    var body: some View {
        NavigationLink {
            SplitBatchView()
                .environmentObject(viewModel)
        } label: {
            HStack{
                //Image(systemName: "divide")
                Text("Divide Total Batch")
            }
            .foregroundStyle(.brandPrimaryGold)
            
        }.simultaneousGesture(TapGesture().onEnded {
            viewModel.doSplitBatchMath()
        })
        .buttonStyle(.custom)
        .tint(Color(UIColor.systemGray5))
    }
}
