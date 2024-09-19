//
//  CBCLoadedCocktailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 2/12/24.
//

import SwiftUI


struct CBCLoadedCocktailView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState private var isInputActive: Bool
    @State private var isShowingPreferencesModal: Bool = false
    @State private var isShowingBottleMathModal: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                VStack {
                    
                    CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName, totalBatchVolume: viewModel.totalBatchVolume)
                    
                    HStack{
                        CocktailCountView(isInputActive: $isInputActive)
                        Spacer()
                        EditIngredientsButton(isShowingIngredientsModal: $isShowingPreferencesModal)
                    }
                    QuantifiedIngredientsListView(isInputActive: $isInputActive)
                }
                .padding()
            }
        }
        .onChange(of: viewModel.quantifiedBatchedIngredients) { _, _ in
            // Force view update when quantifiedBatchedIngredients change
            viewModel.objectWillChange.send()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .jamesHeaderWithNavigation(title: "Batch Calculator", dismiss: dismiss)
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
        VStack(alignment: .center) {
            HStack {
                FontFactory.regularText(cocktailName, size: 22, color: .white, isBold: false)
            }
            HStack {
                FontFactory.regularText("Full Batch:", size: 20, color: .white, isBold: false)
                FontFactory.regularText("\(Int(ceil(totalBatchVolume)))ml", size: 20, color: .white, isBold: false)
            }
            .font(.title3)
            .foregroundStyle(.secondary)
        }
        .bold()
        .padding(.bottom, 25)
    }
}
struct EditIngredientsButton: View {
    @Binding var isShowingIngredientsModal: Bool
    
    var body: some View {
        Button {
            isShowingIngredientsModal.toggle()
            
        } label: {
            VStack{
                Image(systemName: "gearshape")
            }
            .dynamicTypeSize(.xxLarge).bold()
            .foregroundStyle(ColorScheme.interactionTint)
            .padding(.horizontal, 15)
            
            
        }
    }
}

struct CocktailCountView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState.Binding var isInputActive: Bool
    
    var body: some View {
        Text("Cocktail Count:")
            .font(FontFactory.formLabel18)
            .bold()
        TextField("#", value:  $viewModel.numberOfCocktailsText, formatter: viewModel.formatter)
            .padding(5)
            .font(FontFactory.formLabel18)
            .autocorrectionDisabled()
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
            .focused($isInputActive)
            .onTapGesture {
                viewModel.numberOfCocktailsText = 0
            }
            .onChange(of: viewModel.numberOfCocktailsText) { oldValue, newValue in
                viewModel.convertIngredientsToBatchCellData()
            }
            .dynamicTypeSize(.large)
            .frame(width: 100)
    }
}

struct QuantifiedIngredientsListView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState private var isFocused: Bool
    @FocusState.Binding var isInputActive: Bool
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach($viewModel.quantifiedBatchedIngredients, id: \.id) { $ingredient in
                    BatchCellView(
                        quantifiedBatchedIngredient: $ingredient,
                        isFocused: $isFocused
                    )
                }
                VStack {
                    HStack {
                        Text("Batch Dilution")
                            .font(FontFactory.formLabel18)
                        Spacer()
                        Text("\(Int(ceil(viewModel.totalDilutionVolume)))ml")
                            .font(FontFactory.formLabel18)
                    }
                    HStack {
                        Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .tint(ColorScheme.interactionTint)
                        Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                            .font(FontFactory.formLabel18)
                            .frame(width: 50)
                            .onChange(of: viewModel.dilutionPercentage) { oldValue, newValue in
                                viewModel.convertIngredientsToBatchCellData()
                            }
                    }
                }
                SplitBatchNavigationButton()
                    .padding(.top, 20)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    viewModel.finishEditing()
                    viewModel.convertIngredientsToBatchCellData()
                    isInputActive = false
                    isFocused = false
                }
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
                    
            }
        }
        .buttonStyle(.customGreyButton)
        .tint(ColorScheme.buttonTint.opacity(0.5))
    }
}


