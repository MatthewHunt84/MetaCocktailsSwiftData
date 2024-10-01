//
//  GarnishDetailView.swift
//  MetaCocktailsSwiftData
//
//  Created by James Menkal on 7/10/24.
//

import SwiftUI
import SwiftData

struct GarnishDetailView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var addExistingGarnishViewIsActive: Bool
    @FocusState private var keyboardFocused: Bool
    @FocusState private var amountKeyboardFocused: Bool
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var isCreatingCustomGarnish: Bool = false
    @State private var filteredGarnish: [String] = []
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                AddExistingGarnishSearchBarAndListView(viewModel: viewModel, keyboardFocused: _keyboardFocused, isCreatingCustomGarnish: $isCreatingCustomGarnish)
                
                CreateCustomGarnishButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive, isCreatingCustomGarnish: $isCreatingCustomGarnish, keyboardFocused: _keyboardFocused)
                
                AddExistingGarnishToCocktailButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive, isCreatingCustomGarnish: $isCreatingCustomGarnish)
  
            }
            .background(ColorScheme.background)
            .navigationBarTitleDisplayMode(.inline)
            .jamesHeaderWithNavigation(title: "Add Garnish", dismiss: dismiss)
            .scrollContentBackground(.hidden)
        }
        
    }
}

struct AddExistingGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @Environment(\.modelContext) private var modelContext
    @Binding var addExistingGarnishViewIsActive: Bool
    @Binding var isCreatingCustomGarnish: Bool
    
    var body: some View {
        Section {
            UniversalBlueButton(buttonText: "Add to spec", rightImage: Image(systemName: "plus"), includeBorder: true) {
                    viewModel.addExistingGarnishToCocktail(context: modelContext)
                    addExistingGarnishViewIsActive = false
            }
            .disabled(viewModel.existingGarnishIsValid(allGarnishes: garnish) ? false : true)
            .foregroundStyle(viewModel.existingGarnishIsValid(allGarnishes: garnish) ? ColorScheme.interactionTint : Color.secondary)
        }
        .listRowBackground(Color.clear)
    }
}

struct CreateCustomGarnishButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Binding var addExistingGarnishViewIsActive: Bool
    @Binding var isCreatingCustomGarnish: Bool
    @FocusState var keyboardFocused: Bool
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    
    var body: some View {
        
        if let customName = viewModel.finalizedGarnishName, !viewModel.addedGarnish.contains(where: { $0.name == customName }) {
            Section {
                UniversalBlueButton(buttonText: "Add \"\(customName)\" to garnishes", rightImage: Image(systemName: "plus"), includeBorder: true) {
                    if viewModel.customGarnishIsValid(allGarnishes: garnish) {
                        viewModel.addedGarnish.append(Garnish(name: customName))
                        viewModel.clearIngredientData()
                        addExistingGarnishViewIsActive = false
                    } else {
                        for name in garnish {
                            if name.name == customName {
                                viewModel.addedGarnish.append(name)
                                viewModel.clearIngredientData()
                                addExistingGarnishViewIsActive = false
                            }
                        }
                    }
                }
            }
            .listRowBackground(Color.clear)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        else {
            EmptyView()
        }
    }
}

struct AddExistingGarnishSearchBarAndListView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @State private var filteredGarnish: [String] = []
    @Binding var isCreatingCustomGarnish: Bool
    
    var body: some View {
     
            Section(header:  Text("Enter garnish name").font(FontFactory.sectionHeader12)) {
                
                TextField("Search garnishes", text: $viewModel.currentGarnishName)
                    .focused($keyboardFocused)
                    .font(FontFactory.formLabel18)
                    .onChange(of: viewModel.currentGarnishName, initial: true) { old, new in
                        viewModel.finalizedGarnishName = nil
                        viewModel.currentGarnishName = new
                        filteredGarnish = viewModel.matchAllGarnish(garnishes: garnish)
                    }
                    .overlay(alignment: .trailing) {
                        if !viewModel.currentGarnishName.isEmpty {
                            Button {
                                viewModel.currentGarnishName = ""
                            } label: {
                                Image(systemName: "x.circle")
                                    .tint(ColorScheme.interactionTint)
                                    .bold()
                                    .font(.system(size: 18))
                                    .frame(width: 60, height: 40, alignment: .trailing)
                                    .contentShape(Rectangle())
                            }
                        }
                    }
                    .submitLabel(.done)
                    .onSubmit {
                        if !filteredGarnish.contains(where: { $0 == viewModel.currentGarnishName } ) {
                            withAnimation {
                                viewModel.finalizedGarnishName = viewModel.currentGarnishName
                                viewModel.didChooseExistingGarnish = false
                            }
                        } else {
                            viewModel.finalizedGarnishName = nil
                        }
                    }
            }
        
            if keyboardFocused {
                ForEach(filteredGarnish, id: \.self) { garnish in
                    Button {
                        viewModel.currentGarnishName = garnish
                        viewModel.didChooseExistingGarnish = true
                        keyboardFocused = false
                    } label: {
                        Text(garnish)
                    }
                    .tint(.primary)
                }
                .listStyle(.plain)
                .listRowBackground(Color.clear)
            } else {
                EmptyView()
            }
            
        
    }
}

//#Preview {
//    GarnishDetailView(viewModel: AddCocktailViewModel(), addExistingGarnishViewIsActive: .constant(true))
//}
