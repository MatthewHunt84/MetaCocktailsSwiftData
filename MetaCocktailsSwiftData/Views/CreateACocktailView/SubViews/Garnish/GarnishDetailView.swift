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
        
        NavigationStack{
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                List {
                    if !isCreatingCustomGarnish {
                        addExistingGarnishSearchBarAndListView(viewModel: viewModel, keyboardFocused: _keyboardFocused, isCreatingCustomGarnish: $isCreatingCustomGarnish)
                        AddExistingGarnishToCocktailButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive, isCreatingCustomGarnish: $isCreatingCustomGarnish)
                    } else {
                        AddCustomGarnishView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                        AddCustomGarnishToCocktailButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                    }
                    CreateCustomGarnishButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive, isCreatingCustomGarnish: $isCreatingCustomGarnish, keyboardFocused: _keyboardFocused)
                        .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .jamesHeaderWithNavigation(title: "Add Garnish", dismiss: dismiss)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        KeyboardDoneButton(keyboardFocused: _keyboardFocused, amountKeyboardFocused: _amountKeyboardFocused)
                    }
                }
                .task {
                    keyboardFocused = true
                }
            }
        }
    }
}


#Preview {
    GarnishDetailView(viewModel: AddCocktailViewModel(), addExistingGarnishViewIsActive: .constant(true))
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
    
    var body: some View {
        Section {
            Button {
                withAnimation {
                    isCreatingCustomGarnish.toggle()
                    keyboardFocused = true
                }
               
            } label: {
                HStack{
                    Text(isCreatingCustomGarnish ? "Choose existing garnish" : "Add as custom garnish")
                        .font(FontFactory.bottomToolbarButton20)
                    if !isCreatingCustomGarnish {
                        Image(systemName: "plus")
                    }
                   
                }
                .foregroundStyle(ColorScheme.interactionTint)
            }
        }
        .listRowBackground(Color.clear)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct addExistingGarnishSearchBarAndListView: View {
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @State private var filteredGarnish: [String] = []
    @Binding var isCreatingCustomGarnish: Bool
    
    var body: some View {
     
            Section(header:  Text("Existing Garnish Name").font(FontFactory.sectionHeader12)) {
                
                TextField("Search for existing garnish...", text: $viewModel.currentGarnishName)
                    .focused($keyboardFocused)
                    .font(FontFactory.formLabel18)
                    .onChange(of: viewModel.currentGarnishName, initial: true) { old, new in
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
                                    .padding()
                                    .frame(width: 60, height: 40)
                                    .contentShape(Rectangle())
                            }
                        }
                    }
                    .submitLabel(.done)
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
