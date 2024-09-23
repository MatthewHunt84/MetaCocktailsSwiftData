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
                
                VStack(spacing: 10) {
                    
                    CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName)
                    
                    QuantifiedIngredientsListView(isInputActive: $isInputActive)
                }
                .padding()
            }
            .padding(.top, -20)
        }
        .onChange(of: viewModel.quantifiedBatchedIngredients) { _, _ in
            // Force view update when quantifiedBatchedIngredients change
            viewModel.objectWillChange.send()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .jamesHeaderWithNavigation(title: "Batch Calculator", dismiss: dismiss)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditIngredientsButton(isShowingIngredientsModal: $isShowingPreferencesModal)
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
    
    var body: some View {
        FontFactory.mediumText(cocktailName, size: 28, color: .primary, isBold: false)
    }
}

struct EditIngredientsButton: View {
    @Binding var isShowingIngredientsModal: Bool
    
    var body: some View {
        Button {
            isShowingIngredientsModal.toggle()
            
        } label: {
                Image(systemName: "gearshape")
                    .resizable()
                    .foregroundStyle(ColorScheme.interactionTint)
        }
    }
}

struct CocktailCountView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState.Binding var isInputActive: Bool
    
    var body: some View {
        
        HStack {

            FontFactory.mediumText("Number of cocktails", size: 18, color: ColorScheme.tintColor)
            
            Spacer()
            
            TextField("", value:  $viewModel.numberOfCocktailsText, formatter: viewModel.formatter)
                .font(FontFactory.mediumFont(size: 18))
                .multilineTextAlignment(.trailing)
                .autocorrectionDisabled()
                .background(.clear)
                .foregroundStyle(ColorScheme.interactionTint)
                .keyboardType(.decimalPad)
                .frame(maxWidth: 80)
                .focused($isInputActive)
                .onTapGesture {
                    viewModel.numberOfCocktailsText = 0
                }
                .onChange(of: viewModel.numberOfCocktailsText) { oldValue, newValue in
                    viewModel.convertIngredientsToBatchCellData()
                }
        }
    }
}

struct QuantifiedIngredientsListView: View {
    @EnvironmentObject var viewModel: CBCViewModel
    @FocusState private var isFocused: Bool
    @FocusState.Binding var isInputActive: Bool
    
    
    var body: some View {
        
        List {
            
            Section(header: Text("How many cocktails do you need?")) {
                CocktailCountView(isInputActive: $isInputActive)
            }
            
            Section(header: Text("What is the dilution percentage?")) {
                
                VStack {
                    
                    HStack {
                        Text("Dilution")
                            .font(FontFactory.formLabel18)
                        Slider(value: $viewModel.dilutionPercentage, in: 0...100, step: 1.0)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .tint(ColorScheme.interactionTint)
                        Text("\(viewModel.dilutionPercentage, specifier: "%.0f")%")
                            .font(FontFactory.formLabel18)
                            .onChange(of: viewModel.dilutionPercentage) { oldValue, newValue in
                                viewModel.convertIngredientsToBatchCellData()
                            }
                    }
                }
            }
            
            Section(header: CBCIngredientSectionHeader(), footer: CBCIngredientSectionFooter()) {
                ForEach($viewModel.quantifiedBatchedIngredients, id: \.id) { $ingredient in
                    BatchCellView(
                        quantifiedBatchedIngredient: $ingredient,
                        isFocused: $isFocused
                    )
                }
                
                HStack {
                    Text("Dilution")
                        .font(FontFactory.formLabel18)
                    Spacer()
                    Text("\(Int(ceil(viewModel.totalDilutionVolume))) ml")
                        .font(FontFactory.formLabel18)
                        .foregroundStyle(Color.secondary)
                }
            }
            Section{
                HStack(spacing: 0){
                    Spacer()
                    Text("Total Volume: \(viewModel.totalBatchVolume, specifier: "%.0f") ml")
                        .font(FontFactory.formLabel18)
                        .foregroundStyle(Color.secondary)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            .listSectionSpacing(0)
            SplitBatchButton()
                .listStyle(.plain)
                .listRowBackground(Color.clear)
        }
        .listStyle(.insetGrouped)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                    isFocused = false
                    viewModel.finishEditing()
                    viewModel.convertIngredientsToBatchCellData()
                        
                }
                .tint(ColorScheme.interactionTint)
            }
        }
    }
}

struct CBCIngredientSectionHeader: View {
    
    var body: some View {
        Text("Ingredient measurements")
    }
}

struct CBCIngredientSectionFooter: View {
    
    @State var isShowingIngredientSwipeInfo = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Calculating based on bottle count?".uppercased())
                
                Image(systemName: "info.circle")
                    .foregroundStyle(isShowingIngredientSwipeInfo ? ColorScheme.tintColor : ColorScheme.interactionTint)
                    .onTapGesture {
                        isShowingIngredientSwipeInfo.toggle()
                    }
                Spacer()
            }
            
            if isShowingIngredientSwipeInfo {
                Text("Swipe left on any ingredient to calculate by number of bottles instead")
                    .font(.footnote)
                    .foregroundStyle(.brandPrimaryGold)
            }
        }
    }
}

struct SplitBatchButton: View {
    var body: some View {
        
        NavigationLinkWithoutIndicator {
            Text("Divide Total Batch")
                .font(FontFactory.mediumFont(size: 18))
                .foregroundStyle(ColorScheme.interactionTint)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Capsule().strokeBorder(ColorScheme.interactionTint, lineWidth: 1))
        } destination: {
            SplitBatchView()
        }
    }
}

