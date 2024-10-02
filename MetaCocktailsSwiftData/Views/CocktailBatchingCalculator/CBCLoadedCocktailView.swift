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
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingOunceMeasurements: Bool = false
    @State private var isShowingBottleMathAmounts: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 10) {
                
                CBCCocktailHeaderView(cocktailName: viewModel.chosenCocktail.cocktailName)
                
                QuantifiedIngredientsListView(isInputActive: $isInputActive,
                                              isShowingOunceMeasurements: $isShowingOunceMeasurements,
                                              isShowingBottleMathAmounts: $isShowingBottleMathAmounts)
            }
            .padding()
            
            .padding(.top, -20)
        }
        .background(ColorScheme.background)
        .onChange(of: viewModel.quantifiedBatchedIngredients) { _, _ in
            // Force view update when quantifiedBatchedIngredients change
            viewModel.objectWillChange.send()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .jamesHeaderWithNavigation(title: "Batch Calculator", dismiss: dismiss)
        .modalPrentation(Image(systemName:"gearshape"), labelText: "Settings", isPresented: $isShowingPreferencesModal)
        .sheet(isPresented: $isShowingPreferencesModal, content: {
            EditBatchModalView(isShowingOunceMeasurements: $isShowingOunceMeasurements, isShowingBottleMathAmounts: $isShowingBottleMathAmounts)
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
    @FocusState private var bottleBatchInputActive: Bool
    @Binding var isShowingOunceMeasurements: Bool
    @Binding var isShowingBottleMathAmounts: Bool
    
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
                    BatchCellView(quantifiedBatchedIngredient: $ingredient,
                                  isFocused: _isFocused,
                                  bottleBatchInputActive: _bottleBatchInputActive,
                                  isShowingOunceMeasurements: $isShowingOunceMeasurements,
                                  isShowingBottleMathAmounts: $isShowingBottleMathAmounts)
                }
                
                VStack {
                    HStack {
                        Text("Dilution")
                            .font(FontFactory.formLabel18)
                        Spacer()
                        Text("\(Int(ceil(viewModel.totalDilutionVolume))) ml")
                            .font(FontFactory.formLabel18)
                            .foregroundStyle(Color.secondary)
                    }
                    if isShowingOunceMeasurements {
                        Text("\(viewModel.totalDilutionVolume.toOunces, specifier: "%.0f") oz")
                            .font(FontFactory.formLabel18)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            
            Section {
                Text("Total Volume: \(viewModel.totalBatchVolume, specifier: "%.0f") ml")
                    .font(FontFactory.formLabel18)
                    .foregroundStyle(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            
            SplitBatchButton()
                .listStyle(.plain)
                .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .listStyle(.insetGrouped)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                    isFocused = false
                    bottleBatchInputActive = false
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

