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
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                
                ColorScheme.background.ignoresSafeArea()
                
                List {
                    AddGarnishSearchView(viewModel: viewModel, keyboardFocused: _keyboardFocused)
                    AddExistingGarnishToCocktailButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                    CreateCustomGarnishButton(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
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

struct AddGarnishSearchView: View {
    
    @Bindable var viewModel: AddCocktailViewModel
    @FocusState var keyboardFocused: Bool
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @State private var filteredGarnish: [String] = []
    
    
    var body: some View {
        Section(header: Text("Name").font(FontFactory.sectionHeader12)) {
            VStack{
                TextField("Garnish Name", text: $viewModel.currentGarnishName)
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
}
struct AddExistingGarnishToCocktailButton: View {
    @Bindable var viewModel: AddCocktailViewModel
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Garnish.name) var garnish: [Garnish]
    @Environment(\.modelContext) private var modelContext
    @Binding var addExistingGarnishViewIsActive: Bool
    
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
    
    var body: some View {
        Section {
            NavigationLinkWithoutIndicator {
                HStack{
                    Text("Create Custom Garnish")
                        .font(FontFactory.bottomToolbarButton20)
                    Image(systemName: "plus")
                }
                .foregroundStyle(ColorScheme.interactionTint)
            } destination: {
                AddCustomGarnishView(viewModel: viewModel, addExistingGarnishViewIsActive: $addExistingGarnishViewIsActive)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .listRowBackground(Color.clear)
    }
}
