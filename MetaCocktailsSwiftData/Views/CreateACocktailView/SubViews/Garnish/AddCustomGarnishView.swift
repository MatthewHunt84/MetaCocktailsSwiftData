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
    @FocusState var keyboardFocused: Bool
    
    var body: some View {
            Section(header: Text("Custom Garnish Name").font(FontFactory.sectionHeader12)) {
                TextField("Create custom garnish", text: $viewModel.currentGarnishName)
                    .focused($keyboardFocused)
                    .overlay(alignment: .trailing) {
                        if !viewModel.currentGarnishName.isEmpty {
                            Button {
                                viewModel.currentGarnishName = ""
                            } label: {
                                Image(systemName: "x.circle")
                                    .tint(ColorScheme.interactionTint)
                                    .bold()
                                    .font(.system(size: 18))
                                    .padding()
                                    .frame(width: 60, height: 40)
                                    .contentShape(Rectangle())
                            }
                        }
                    }
                    .submitLabel(.done)
                
            }
        
    }
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
