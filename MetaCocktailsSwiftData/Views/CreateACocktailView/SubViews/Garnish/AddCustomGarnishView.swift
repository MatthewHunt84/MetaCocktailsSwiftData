//
//  AddCustomGarnishView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/10/24.
//

import SwiftUI
import SwiftData

struct AddCustomGarnishView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var addExistingGarnishViewIsActive: Bool
    @FocusState private var keyboardFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                ColorScheme.background.ignoresSafeArea()
                Form {
                    Section("Name") {
                        TextField("Garnish Name", text: $viewModel.currentGarnishName)
                            .focused($keyboardFocused)
                    }
                    AddCustomGarnishToCocktailButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .task {
                    keyboardFocused = true
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Add Custom Garnish", dismiss: dismiss)
        }
    }
}

#Preview {
    AddCustomGarnishView(viewModel: AddCocktailViewModel(), addExistingGarnishViewIsActive: .constant(true))
}

struct AddCustomGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var addExistingGarnishViewIsActive: Bool
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]

    
    var body: some View {
        Section {
            UniversalBlueButton(buttonText: "Add to spec", rightImage: Image(systemName: "plus"), includeBorder: true) {
                if viewModel.customGarnishIsValid(allGarnishes: garnish){
                    viewModel.addedGarnish.append(Garnish(name: viewModel.currentGarnishName))
                    viewModel.clearIngredientData()
                    addExistingGarnishViewIsActive = false
                } else {
                    for name in garnish {
                        if name.name == viewModel.currentGarnishName {
                            viewModel.addedGarnish.append(name)
                            viewModel.clearIngredientData()
                            addExistingGarnishViewIsActive = false
                        }
                    }
                }
            }
            .disabled(viewModel.currentGarnishName == "" ? true : false)
            .foregroundStyle(viewModel.currentGarnishName == "" ? ColorScheme.interactionTint : Color.secondary)
        }
        .listRowBackground(Color.clear)
    }
}
