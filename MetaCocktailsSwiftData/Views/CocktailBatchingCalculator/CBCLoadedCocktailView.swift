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
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName, totalBatchVolume: viewModel.totalBatchVolume)
                    Spacer()
                }
                VStack {
                    HStack{
                        CocktailCountView(isInputActive: _isInputActive)
                        Spacer()
                        EditIngredientsButton(isShowingIngredientsModal: $isShowingPreferencesModal)
                    }
                }
                QuantifiedIngredientsListView()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 9)
                        .bold()
                        .tint(.cyan)
                }
            }
            
            ToolbarItem(placement: .navigation) {
                Text("Batching Calculator")
                    .font(.largeTitle).bold()
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
                    .foregroundStyle(.brandPrimaryGold)
                    .font(.title2)
            }
            HStack {
                Text("Full Batch:")
                Text("\(Int(ceil(totalBatchVolume)))ml")
            }
            .font(.title3)
            .foregroundStyle(.secondary)
        }
        .bold()
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
            .frame(width: 125)
    }
}

struct QuantifiedIngredientsListView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach($viewModel.quantifiedBatchedIngredients, id: \.self) { ingredient in
                    BatchCellView(quantifiedBatchedIngredient: ingredient)
                }
                VStack {
                    HStack {
                        Text("Batch Dilution")
                        Spacer()
                        Text("\(Int(ceil(viewModel.totalDilutionVolume)))ml")
                    }
                    HStack {
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
                
                SplitBatchNavigationButton()
                
            }
        }
    }
}

struct SplitBatchNavigationButton: View {
    @EnvironmentObject var viewModel: CBCViewModel
    
    var body: some View {
        NavigationLink {
            SplitBatchView()
        } label: {
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
        }
    }
}
