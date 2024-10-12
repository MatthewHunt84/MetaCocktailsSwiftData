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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                BlackGlassBackgroundView().ignoresSafeArea()
                
                List {
                    
                    AddExistingGarnishSearchBarAndListView(viewModel: viewModel)
                    
                    CreateCustomGarnishButton(viewModel: viewModel)
                    
                    AddExistingGarnishToCocktailButton(viewModel: viewModel)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Add Garnish", dismiss: dismiss)
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct AddExistingGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Section {
            
            if viewModel.customGarnishNameEntered == nil {
                UniversalButton(buttonText: "Add to spec", rightImage: Image(systemName: "plus"), includeBorder: true) {
                    viewModel.addExistingGarnishToCocktail(context: modelContext)
                    dismiss()
                }
                .disabled(viewModel.existingGarnishIsValid(allGarnishes: garnish) ? false : true)
                .foregroundStyle(viewModel.existingGarnishIsValid(allGarnishes: garnish) ? ColorScheme.interactionTint : Color.red)
            } else {
                EmptyView()
            }
        }
        .listRowBackground(Color.clear)
    }
}

struct CreateCustomGarnishButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        if let customName = viewModel.customGarnishNameEntered, !viewModel.addedGarnish.contains(where: { $0.name == customName }), customName != "" {
            Section {
                UniversalButton(buttonText: "Add \"\(customName)\" garnish", rightImage: Image(systemName: "plus"), includeBorder: true) {
                    if viewModel.customGarnishIsValid(allGarnishes: garnish) {
                        viewModel.addedGarnish.append(Garnish(name: customName))
                        viewModel.clearIngredientData()
                        dismiss()
                    } else {
                        for name in garnish {
                            if name.name == customName {
                                viewModel.addedGarnish.append(name)
                                viewModel.clearIngredientData()
                                dismiss()
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
    
    var body: some View {
        
        Section(header:  Text("Choose garnish").font(FontFactory.sectionHeader12)) {
            
            TextField("Search for garnish...", text: $viewModel.currentGarnishName)
                .focused($keyboardFocused)
                .font(FontFactory.formLabel18)
                .onChange(of: viewModel.currentGarnishName, initial: true) { old, new in
                    viewModel.customGarnishNameEntered = nil
                    viewModel.currentGarnishName = new
                    viewModel.filteredGarnish = viewModel.matchAllGarnish(garnishes: garnish)
                }
                .clearSearchButton(text: $viewModel.currentGarnishName, isEmbeddedInSection: true) {
                    viewModel.currentGarnishName = ""
                }
                .submitLabel(.done)
                .onSubmit {
                    if !viewModel.filteredGarnish.contains(where: { $0 == viewModel.currentGarnishName } ) {
                        withAnimation {
                            viewModel.customGarnishNameEntered = viewModel.currentGarnishName
                            viewModel.didChooseExistingGarnish = false
                        }
                    } else {
                        viewModel.customGarnishNameEntered = nil
                    }
                }
            
            if keyboardFocused && viewModel.currentGarnishName != "" {
                if !viewModel.filteredGarnish.isEmpty {
                    ForEach(viewModel.filteredGarnish, id: \.self) { garnish in
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
                    ContentUnavailableView("No matching garnishes",
                                           systemImage: "magnifyingglass",
                                           description: Text("Click done to add \"\(viewModel.currentGarnishName)\" to garnish library"))
                    .listStyle(.plain)
                    .listRowBackground(Color.clear)
                }
            } else {
                EmptyView()
            }
        }
    }
}

//#Preview {
//    GarnishDetailView(viewModel: AddCocktailViewModel(), addExistingGarnishViewIsActive: .constant(true))
//}
